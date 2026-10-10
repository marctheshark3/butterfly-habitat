"""Check ID consistency, source provenance, and the actual marked print meshes."""
from collections import Counter, defaultdict
import hashlib
from itertools import product
import json
import math
from pathlib import Path
import runpy
import unittest
import xml.etree.ElementTree as ET
import zipfile

from test_habitat import read_stl

ROOT = Path(__file__).resolve().parents[1]
LABELED = ROOT / 'candidate/labeled'
IDS = runpy.run_path(str(ROOT / 'src/part_ids.py'))


def same_oriented_mesh(original, sliced):
    def normalized(triangles):
        low = [min(v[axis] for t in triangles for v in t) for axis in range(3)]
        return [tuple(tuple(v[a]-low[a] for a in range(3)) for v in t) for t in triangles]
    original, sliced = normalized(original), normalized(sliced)
    vertices = {v: i for i, v in enumerate(sorted({v for t in original for v in t}))}
    # 3MF decimal serialization and mesh centering introduce micrometre-scale
    # rounding. Match actual distances, avoiding decimal rounding boundaries.
    tolerance = .0001
    bins = defaultdict(list)
    def key(v):
        return tuple(math.floor(value/tolerance) for value in v)
    for v, index in vertices.items():
        bins[key(v)].append((v, index))
    lookup = {}
    for v in {v for t in sliced for v in t}:
        bucket = key(v)
        candidates = [((sum((v[a]-other[a])**2 for a in range(3))), index)
                      for delta in product((-1, 0, 1), repeat=3)
                      for other, index in bins[tuple(bucket[a]+delta[a] for a in range(3))]]
        if not candidates or min(candidates)[0] > tolerance**2:
            return False
        lookup[v] = min(candidates)[1]
    def faces(triangles, ids):
        result = []
        for face in triangles:
            t = tuple(ids[v] for v in face)
            result.append(min(t, t[1:]+t[:1], t[2:]+t[:2]))
        return Counter(result)
    return faces(original, vertices) == faces(sliced, lookup)


def project_triangles(archive):
    ns = {'m': 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
    production = 'http://schemas.microsoft.com/3dmanufacturing/production/2015/06'
    def translation(text):
        values = [float(v) for v in text.split()]
        if values[:9] != [1, 0, 0, 0, 1, 0, 0, 0, 1]:
            raise ValueError('Slicer changed source orientation or scale')
        return values[9:]
    def visit(path, oid, offset):
        root = ET.fromstring(archive.read(path))
        obj = next(o for o in root.findall('m:resources/m:object', ns) if o.get('id') == oid)
        faces = []
        mesh = obj.find('m:mesh', ns)
        if mesh is not None:
            vertices = [tuple(float(v.get(axis)) + offset[a] for a, axis in enumerate('xyz'))
                        for v in mesh.findall('m:vertices/m:vertex', ns)]
            faces += [tuple(vertices[int(t.get('v'+str(i)))] for i in (1, 2, 3))
                      for t in mesh.findall('m:triangles/m:triangle', ns)]
        for component in obj.findall('m:components/m:component', ns):
            move = translation(component.get('transform', '1 0 0 0 1 0 0 0 1 0 0 0'))
            faces += visit(component.get('{'+production+'}path', path).lstrip('/'),
                           component.get('objectid'), [offset[a]+move[a] for a in range(3)])
        return faces
    root = ET.fromstring(archive.read('3D/3dmodel.model'))
    builds = root.findall('m:build/m:item', ns)
    if len(builds) != 1:
        raise ValueError('Expected exactly one labeled part per project')
    return visit('3D/3dmodel.model', builds[0].get('objectid'), translation(builds[0].get('transform')))


class PartIDTests(unittest.TestCase):
    def test_ids_are_unique_and_shared_by_models_and_guides(self):
        manifest = json.loads((LABELED / 'assembly/manifest.json').read_text())
        parts = {i['name']: i['part_id'] for i in manifest['items'] if i['kind'] == 'printed'}
        self.assertEqual(parts, IDS['PART_IDS'])
        self.assertEqual(len(set(parts.values())), 15)
        for panel in manifest['panels']:
            name = panel['name']
            self.assertEqual(parts[name][:-1], parts[name+'-clamp'][:-1])
            self.assertEqual(parts[name][-1], '1')
            self.assertEqual(parts[name+'-clamp'][-1], '2')
        instructions = json.loads((ROOT / 'inspector/instructions.json').read_text())
        self.assertEqual(instructions['part_ids'], parts)
        guide = (ROOT / 'docs/ASSEMBLY.md').read_text()
        paper = (ROOT / 'candidate/templates/part-labels.svg').read_text()
        for name, code in parts.items():
            self.assertIn('| '+code+' |', guide)
            self.assertIn(code+' — '+name, paper)

    def test_variant_evidence_matches_geometry_sources(self):
        manifest = json.loads((LABELED / 'assembly/manifest.json').read_text())
        for field, source in [('source_sha256', 'src/butterfly-habitat.py'),
                              ('label_source_sha256', 'src/part_ids.py'),
                              ('label_exporter_sha256', 'scripts/label-parts.py')]:
            self.assertEqual(manifest[field], hashlib.sha256((ROOT / source).read_bytes()).hexdigest())
        report = json.loads((LABELED / 'validation.json').read_text())
        self.assertTrue(report['geometry_pass'])
        self.assertEqual(report['errors'], [])
        self.assertEqual(report['pairs_checked'], 7381)
        self.assertTrue(report['motion_proof']['every_labeled_body_is_subset'])
        self.assertEqual(report['motion_proof']['method'], 'conservative original envelopes')
        self.assertEqual(report['physical'], 'pending')
        for label in report['part_ids'].values():
            self.assertGreater(label['removed_mm3'], 0)
            self.assertEqual(label['material_added_mm3'], 0)
            self.assertGreaterEqual(label['minimum_backing_checked_mm'], 1.6)
            self.assertTrue(label['envelope_unchanged'])

    def test_labeled_stls_are_manifold_connected_and_keep_print_bounds(self):
        for name in IDS['PART_IDS']:
            with self.subTest(part=name):
                path = LABELED / 'stl' / f'habitat-{name}.stl'
                triangles = read_stl(path)
                original = read_stl(ROOT / 'candidate/stl' / path.name)
                for axis in range(3):
                    for bound in (min, max):
                        self.assertAlmostEqual(bound(v[axis] for t in triangles for v in t),
                                               bound(v[axis] for t in original for v in t), places=4)
                edges = defaultdict(list)
                for i, (a, b, c) in enumerate(triangles):
                    for start, end in ((a, b), (b, c), (c, a)):
                        edges[tuple(sorted((start, end)))].append((i, start < end))
                adjacent = defaultdict(set)
                for occurrences in edges.values():
                    self.assertEqual(len(occurrences), 2)
                    (a, direction), (b, other) = occurrences
                    self.assertNotEqual(direction, other)
                    adjacent[a].add(b)
                    adjacent[b].add(a)
                seen, queue = {0}, [0]
                while queue:
                    for i in adjacent[queue.pop()] - seen:
                        seen.add(i)
                        queue.append(i)
                self.assertEqual(len(seen), len(triangles))

    def test_labeled_slices_are_fresh_and_use_matte_profiles(self):
        results = json.loads((LABELED / 'slicing-PLA-Matte/results.json').read_text())
        self.assertEqual({r['part'].removeprefix('habitat-') for r in results}, set(IDS['PART_IDS']))
        for r in results:
            self.assertEqual(r['exit_code'], 0)
            self.assertTrue(r['gcode_present'])
            self.assertEqual(r['filament_profile'], 'Bambu PLA Matte @BBL P1S 0.4 nozzle')
            self.assertEqual(r['stl_sha256'], hashlib.sha256((LABELED / 'stl' / (r['part']+'.stl')).read_bytes()).hexdigest())
            self.assertEqual(r['project_sha256'], hashlib.sha256((LABELED / 'slicing-PLA-Matte' / r['part'] / 'sliced.3mf').read_bytes()).hexdigest())
            with zipfile.ZipFile(LABELED / 'slicing-PLA-Matte' / r['part'] / 'sliced.3mf') as archive:
                settings = json.loads(archive.read('Metadata/project_settings.config'))
                self.assertEqual(settings['filament_settings_id'], [r['filament_profile']])
                self.assertEqual(settings['filament_colour'], [r['filament_color']])
                self.assertTrue(same_oriented_mesh(read_stl(LABELED / 'stl' / (r['part']+'.stl')),
                                                   project_triangles(archive)), r['part'])
