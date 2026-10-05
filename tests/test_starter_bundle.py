"""Check download integrity and deterministic packaging."""
import importlib.util
from pathlib import Path
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('starter_bundle', ROOT / 'scripts/package-starter.py')
bundle = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bundle)


class BundleTests(unittest.TestCase):
    def test_current_projects_match_cad_sources_and_material_settings(self):
        files = bundle.collect_files()
        self.assertEqual(sum(name.endswith('.3mf') for name in files), 4)
        self.assertEqual(sum(name.endswith('.stl') for name in files), 6)
        bundle.check_bundle(bundle.DIRECTORY / (bundle.BUNDLE_NAME + '.zip'), files)

    def test_packaging_is_repeatable(self):
        files = {'README.md': b'Guide', 'plate.3mf': b'fixture'}
        with tempfile.TemporaryDirectory() as directory:
            first, second = Path(directory) / 'a.zip', Path(directory) / 'b.zip'
            bundle.build_bundle(first, files)
            bundle.build_bundle(second, dict(reversed(list(files.items()))))
            self.assertEqual(first.read_bytes(), second.read_bytes())

    def test_stale_or_extra_zip_content_is_rejected(self):
        files = {'README.md': b'current guide'}
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'bundle.zip'
            bundle.build_bundle(path, {'README.md': b'old guide'})
            with self.assertRaisesRegex(ValueError, 'outdated'):
                bundle.check_bundle(path, files)
            bundle.build_bundle(path, files)
            with zipfile.ZipFile(path, 'a') as archive:
                archive.writestr(bundle.BUNDLE_NAME + '/unexpected-device.json', '{}')
            with self.assertRaisesRegex(ValueError, 'inventory'):
                bundle.check_bundle(path, files)
