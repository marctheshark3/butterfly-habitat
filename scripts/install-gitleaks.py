"""Install a checksum-pinned Gitleaks release into ignored .local/bin.

Checksums are from the official v8.30.1 release. No credentials are needed.
"""
import hashlib
import io
from pathlib import Path
import platform
import tarfile
import tempfile
import urllib.request


ROOT = Path(__file__).resolve().parents[1]
VERSION = '8.30.1'
CHECKSUMS = {
    'linux_x64': '551f6fc83ea457d62a0d98237cbad105af8d557003051f41f3e7ca7b3f2470eb',
    'linux_arm64': 'e4a487ee7ccd7d3a7f7ec08657610aa3606637dab924210b3aee62570fb4b080',
    'darwin_x64': 'dfe101a4db2255fc85120ac7f3d25e4342c3c20cf749f2c20a18081af1952709',
    'darwin_arm64': 'b40ab0ae55c505963e365f271a8d3846efbc170aa17f2607f13df610a9aeb6a5',
}


def install():
    machine = {'x86_64': 'x64', 'AMD64': 'x64', 'aarch64': 'arm64', 'arm64': 'arm64'}.get(platform.machine())
    target = f'{platform.system().lower()}_{machine}'
    if target not in CHECKSUMS:
        raise SystemExit('Install Gitleaks 8 manually on this platform and pass --gitleaks /path/to/binary.')
    name = f'gitleaks_{VERSION}_{target}.tar.gz'
    url = f'https://github.com/gitleaks/gitleaks/releases/download/v{VERSION}/{name}'
    request = urllib.request.Request(url, headers={'User-Agent': 'butterfly-habitat-checks'})
    with urllib.request.urlopen(request, timeout=60) as response:
        data = response.read()
    if hashlib.sha256(data).hexdigest() != CHECKSUMS[target]:
        raise SystemExit('Gitleaks checksum mismatch; binary was not installed.')
    with tarfile.open(fileobj=io.BytesIO(data), mode='r:gz') as archive:
        member = archive.getmember('gitleaks')
        if not member.isfile():
            raise SystemExit('Release does not contain a regular gitleaks binary.')
        executable = archive.extractfile(member).read()
    destination = ROOT / '.local/bin/gitleaks'
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(dir=destination.parent, delete=False) as output:
        temporary = Path(output.name)
        output.write(executable)
    try:
        temporary.chmod(0o700)
        temporary.replace(destination)
    finally:
        temporary.unlink(missing_ok=True)
    print(f'Installed Gitleaks {VERSION} with verified SHA-256 in {destination}')


if __name__ == '__main__':
    install()
