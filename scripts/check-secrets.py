"""Audit Git-visible files and archive contents without displaying secret values.

Requires Gitleaks 8. Use --history before a push to include all local refs and
historical ZIP/3MF blobs, which a text-only Git diff cannot inspect.
"""
import argparse
import io
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
MAX_ARCHIVE_MEMBERS = 10000
MAX_EXPANDED_BYTES = 512 * 1024 * 1024
MAX_MEMBER_BYTES = 128 * 1024 * 1024


def git(*args):
    return subprocess.check_output(['git', '-C', str(ROOT), *args])


def unpack(data, label, destination, labels, depth=0, budget=None):
    """Detect ZIP by content, including .3mf; never trust member paths on disk."""
    if not zipfile.is_zipfile(io.BytesIO(data)):
        return 0
    if depth >= 4:
        raise ValueError(f'Archive nesting exceeds audit limit: {label}')
    if budget is None:
        budget = {'members': 0, 'bytes': 0}
    count = 0
    with zipfile.ZipFile(io.BytesIO(data)) as archive:
        for member in archive.infolist():
            if member.is_dir():
                continue
            budget['members'] += 1
            budget['bytes'] += member.file_size
            if (budget['members'] > MAX_ARCHIVE_MEMBERS
                    or budget['bytes'] > MAX_EXPANDED_BYTES
                    or member.file_size > MAX_MEMBER_BYTES):
                raise ValueError(f'Archive exceeds audit limits: {label}')
            content = archive.read(member)
            member_label = label + '!' + member.filename
            # Numbered .txt files also ensure the scanner sees text metadata
            # whose original extension is not recognized. Binary data stays binary.
            path = destination / f'{len(labels):08d}.txt'
            path.write_bytes(content)
            labels[str(path)] = member_label
            count += 1 + unpack(content, member_label, destination, labels, depth + 1, budget)
    return count


def scan(binary, config, args, label, temporary, labels):
    report = temporary / (label + '.json')
    result = subprocess.run(
        [binary, *args, '--config', str(config), '--redact=100',
         '--ignore-gitleaks-allow', '--no-banner', '--no-color',
         '--max-decode-depth=5', '--report-format=json', '--report-path', str(report)],
        cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=300,
    )
    if result.returncode not in (0, 1) or not report.exists():
        raise RuntimeError(f'{label}: scanner failed (exit {result.returncode}); audit incomplete')
    findings = json.loads(report.read_text())
    if not isinstance(findings, list) or any(not isinstance(f, dict) for f in findings):
        raise RuntimeError(f'{label}: invalid scanner report; audit incomplete')
    if result.returncode == 1 and not findings:
        raise RuntimeError(f'{label}: scanner returned failure without findings; audit incomplete')
    print(f'{label}: {len(findings)} findings', flush=True)
    for finding in findings:
        filename = finding.get('File', '')
        safe_path = labels.get(filename, filename.replace(str(temporary) + '/', ''))
        # Deliberately omit Secret, Match, author/email and source excerpts.
        print(json.dumps({'file': safe_path, 'line': finding.get('StartLine'),
                          'rule': finding.get('RuleID')}), flush=True)
    return bool(findings)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--gitleaks', default=None)
    parser.add_argument('--history', action='store_true')
    args = parser.parse_args(argv)
    binary = shutil.which(args.gitleaks) if args.gitleaks else (
        shutil.which(str(ROOT / '.local/bin/gitleaks')) or shutil.which('gitleaks'))
    if not binary:
        raise SystemExit('Gitleaks is required; run python3 scripts/install-gitleaks.py. Audit incomplete.')
    config = ROOT / '.gitleaks.toml'
    with tempfile.TemporaryDirectory(prefix='habitat-secret-check-') as temporary_name:
        temporary = Path(temporary_name)
        snapshot = temporary / 'files'
        expanded = temporary / 'archive-contents'
        snapshot.mkdir()
        expanded.mkdir()
        labels = {}
        budget = {'members': 0, 'bytes': 0}
        paths = set(git('ls-files', '--cached', '--others', '--exclude-standard', '-z').split(b'\0'))
        files = members = 0
        for raw in sorted(paths - {b''}):
            relative = Path(raw.decode('utf-8', errors='surrogateescape'))
            source = ROOT / relative
            if source.is_symlink():
                # Do not read unrelated files through repository symlinks.
                continue
            if not source.is_file():
                continue
            data = source.read_bytes()
            target = snapshot / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            labels[str(target)] = str(relative)
            files += 1
            members += unpack(data, str(relative), expanded, labels, budget=budget)
        print(f'Current files: {files}; explicitly unpacked archive entries: {members}', flush=True)
        failed = scan(binary, config, ['dir', str(snapshot)], 'current-files', temporary, labels)
        failed |= scan(binary, config, ['git', '--pre-commit', '--staged'],
                       'staged-diff', temporary, labels)
        # The index may contain different bytes than the working tree. Git diffs
        # show binary archives as changed but do not expose their contents.
        staged_members = 0
        for raw in git('diff', '--cached', '--name-only', '--diff-filter=ACMR', '-z').split(b'\0'):
            if raw:
                name = raw.decode('utf-8', errors='surrogateescape')
                staged_members += unpack(git('show', ':' + name), name + ' (staged)',
                                         expanded, labels, budget=budget)
        print(f'Staged archive entries: {staged_members}', flush=True)
        if args.history:
            failed |= scan(binary, config, ['git', '--log-opts=--all'],
                           'all-local-history', temporary, labels)
            historical = 0
            for line in git('rev-list', '--objects', '--all').decode().splitlines():
                oid, separator, filename = line.partition(' ')
                if separator and Path(filename).suffix.lower() in ('.3mf', '.zip'):
                    data = git('cat-file', 'blob', oid)
                    members += unpack(data, f'{filename}@{oid[:12]}', expanded, labels, budget=budget)
                    historical += 1
            print(f'Historical ZIP/3MF blobs: {historical}', flush=True)
        failed |= scan(binary, config, ['dir', str(expanded)],
                       'unpacked-archives', temporary, labels)
        print('Secrets detected; do not commit or push.' if failed else
              'No secrets detected. Manually review shared images and device metadata too.')
        return 1 if failed else 0


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError, zipfile.BadZipFile) as error:
        # Scanner stdout/stderr and matched source excerpts are never echoed.
        raise SystemExit(f'Secret audit incomplete ({type(error).__name__}); do not commit or push.') from None
