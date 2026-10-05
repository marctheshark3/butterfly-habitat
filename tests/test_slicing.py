"""Slicer orchestration checks without requiring a printer or Bambu Studio."""
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest import mock
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('habitat_slicing', ROOT / 'scripts/slice.py')
slicing = importlib.util.module_from_spec(spec)
spec.loader.exec_module(slicing)


class SlicingTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.profiles = self.root / 'profiles'
        self.profiles.mkdir()
        for name, kind in [('Bambu Lab P1S 0.4 nozzle', 'machine'),
                           ('0.20mm Standard @BBL X1C', 'process'),
                           ('Generic PETG', 'filament'), ('Generic PLA', 'filament')]:
            (self.profiles / (name + '.json')).write_text(json.dumps(
                {'name': name, 'type': kind, 'default_nozzle_volume_type': ['Standard']}))
        (self.root / 'stl').mkdir()
        for part in ['habitat-base', 'habitat-front']:
            (self.root / 'stl' / (part + '.stl')).write_bytes(b'fixture STL for orchestration')
        self.args = ['--candidate', str(self.root), '--profiles', str(self.profiles)]

    def successful_slice(self, command, **kwargs):
        self.assertEqual(command[command.index('--orient') + 1], '0')
        with zipfile.ZipFile(Path(kwargs['cwd']) / 'sliced.3mf', 'w') as archive:
            archive.writestr('Metadata/plate_1.gcode', 'G1 X20 E1\n')
        return subprocess.CompletedProcess(command, 0)

    def run_slice(self, extra=(), callback=None):
        with contextlib.redirect_stdout(io.StringIO()), mock.patch.object(
                slicing.subprocess, 'run', side_effect=callback or self.successful_slice):
            return slicing.main(self.args + list(extra))

    def results(self):
        return {r['part']: r for r in json.loads((self.root / 'slicing/results.json').read_text())}

    def test_partial_slice_preserves_other_parts_and_refreshes_source_hash(self):
        self.assertEqual(self.run_slice(), 0)
        previous = self.results()
        (self.root / 'stl/habitat-base.stl').write_bytes(b'changed source')
        self.assertEqual(self.run_slice(['--part', 'habitat-base']), 0)
        current = self.results()
        self.assertEqual(len(current), 2)
        self.assertEqual(current['habitat-front'], previous['habitat-front'])
        self.assertNotEqual(current['habitat-base']['stl_sha256'], previous['habitat-base']['stl_sha256'])
        self.assertTrue(current['habitat-front']['supports_enabled'])
        self.assertFalse(current['habitat-base']['supports_enabled'])

    def test_old_project_cannot_mask_missing_new_gcode(self):
        self.run_slice()
        project = self.root / 'slicing/habitat-base/sliced.3mf'
        original = project.read_bytes()
        empty_run = lambda command, **kwargs: subprocess.CompletedProcess(command, 0)
        self.assertEqual(self.run_slice(['--part', 'habitat-base'], empty_run), 1)
        self.assertFalse(self.results()['habitat-base']['gcode_present'])
        self.assertEqual(project.read_bytes(), original)
        self.assertTrue(self.results()['habitat-front']['gcode_present'])

    def test_no_matches_preserves_existing_report(self):
        self.run_slice()
        report = self.root / 'slicing/results.json'
        original = report.read_bytes()
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            self.run_slice(['--part', 'missing'])
        self.assertEqual(report.read_bytes(), original)

    def test_pla_requires_separate_output_and_keeps_petg_evidence(self):
        self.run_slice()
        original = (self.root / 'slicing/results.json').read_bytes()
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            self.run_slice(['--filament', 'Generic PLA'])
        output = self.root / 'pla'
        self.assertEqual(self.run_slice(['--filament', 'Generic PLA', '--output', str(output)]), 0)
        self.assertEqual(json.loads((output / 'filament.json').read_text())['name'], 'Generic PLA')
        self.assertEqual((self.root / 'slicing/results.json').read_bytes(), original)

    def test_changed_settings_cannot_silently_mix_with_old_slices(self):
        self.run_slice()
        path = self.profiles / '0.20mm Standard @BBL X1C.json'
        profile = json.loads(path.read_text())
        profile['layer_height'] = '0.12'
        path.write_text(json.dumps(profile))
        original = (self.root / 'slicing/results.json').read_bytes()
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            self.run_slice(['--part', 'habitat-base'])
        self.assertEqual((self.root / 'slicing/results.json').read_bytes(), original)
