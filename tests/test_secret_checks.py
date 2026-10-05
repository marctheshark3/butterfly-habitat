"""Security regressions: staged archives, traversal, limits and scanner failures."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest
from unittest import mock
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('secret_checks', ROOT / 'scripts/check-secrets.py')
checks = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checks)
SCANNER = shutil.which(str(ROOT / '.local/bin/gitleaks')) or shutil.which('gitleaks')
SYNTHETIC_CODE = ''.join(['TEST', 'ONLY'])


def archive_bytes(name, content):
    data = io.BytesIO()
    with zipfile.ZipFile(data, 'w', zipfile.ZIP_DEFLATED) as archive:
        archive.writestr(name, content)
    return data.getvalue()


class ArchiveTests(unittest.TestCase):
    def test_nested_archive_cannot_write_member_paths(self):
        payload = archive_bytes('part.3mf', archive_bytes('../../outside.json', '{}'))
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / 'expanded'
            destination.mkdir()
            labels = {}
            self.assertEqual(checks.unpack(payload, 'bundle.zip', destination, labels), 2)
            self.assertEqual(len(list(destination.iterdir())), 2)
            self.assertTrue(all(Path(path).parent == destination for path in labels))
            self.assertIn('bundle.zip!part.3mf!../../outside.json', labels.values())

    def test_expansion_limit_fails_before_writing_oversized_member(self):
        payload = archive_bytes('oversized.txt', 'x' * 32)
        with tempfile.TemporaryDirectory() as directory, mock.patch.object(checks, 'MAX_MEMBER_BYTES', 8):
            with self.assertRaisesRegex(ValueError, 'audit limits'):
                checks.unpack(payload, 'bundle.zip', Path(directory), {})
            self.assertEqual(list(Path(directory).iterdir()), [])

    def test_scanner_failure_with_empty_report_is_not_clean(self):
        def failed(command, **kwargs):
            Path(command[command.index('--report-path') + 1]).write_text('[]')
            return subprocess.CompletedProcess(command, 1)
        with tempfile.TemporaryDirectory() as directory, mock.patch.object(checks.subprocess, 'run', side_effect=failed):
            with self.assertRaisesRegex(RuntimeError, 'audit incomplete'):
                checks.scan('gitleaks', ROOT / '.gitleaks.toml', ['dir', directory],
                            'fixture', Path(directory), {})


@unittest.skipUnless(SCANNER, 'Install Gitleaks with scripts/install-gitleaks.py for integration checks.')
class ScannerIntegrationTests(unittest.TestCase):
    def test_staged_3mf_secret_is_found_even_when_working_copy_is_clean(self):
        with tempfile.TemporaryDirectory() as directory:
            repo = Path(directory)
            subprocess.run(['git', 'init', '-q', str(repo)], check=True)
            shutil.copy2(ROOT / '.gitleaks.toml', repo / '.gitleaks.toml')
            project = repo / 'plate.3mf'
            project.write_bytes(archive_bytes('Metadata/device.json', json.dumps({'access_code': SYNTHETIC_CODE})))
            subprocess.run(['git', '-C', str(repo), 'add', 'plate.3mf'], check=True)
            project.write_bytes(archive_bytes('Metadata/device.json', '{}'))
            output = io.StringIO()
            with mock.patch.object(checks, 'ROOT', repo), contextlib.redirect_stdout(output):
                result = checks.main(['--gitleaks', SCANNER])
            self.assertEqual(result, 1)
            self.assertIn('printer-access-code', output.getvalue())
            self.assertIn('(staged)!Metadata/device.json', output.getvalue())
            self.assertNotIn(SYNTHETIC_CODE, output.getvalue())

    def test_nested_zip_3mf_credential_is_detected_and_redacted(self):
        inner = archive_bytes('Metadata/device.json', json.dumps({'access_code': SYNTHETIC_CODE}))
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            expanded = root / 'expanded'
            expanded.mkdir()
            labels = {}
            checks.unpack(archive_bytes('part.3mf', inner), 'bundle.zip', expanded, labels)
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                found = checks.scan(SCANNER, ROOT / '.gitleaks.toml', ['dir', str(expanded)],
                                    'fixture', root, labels)
            self.assertTrue(found)
            self.assertIn('bundle.zip!part.3mf!Metadata/device.json', output.getvalue())
            self.assertNotIn(SYNTHETIC_CODE, output.getvalue())
