"""Independent release-candidate regression tests; no CAD or numpy needed."""
import collections
import hashlib
import json
from pathlib import Path
import struct
import unittest

ROOT=Path(__file__).resolve().parents[1]
C=ROOT/'candidate'


def read_stl(path):
    data=path.read_bytes(); count=struct.unpack_from('<I',data,80)[0]
    if len(data)!=84+50*count:
        raise ValueError(f'{path}: truncated or non-binary STL')
    return [tuple(tuple(values[k:k+3]) for k in [3,6,9])
            for values in (struct.unpack_from('<12fH',data,84+50*i) for i in range(count))]


class CandidateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.manifest=json.loads((C/'assembly/manifest.json').read_text())
        cls.report=json.loads((C/'validation.json').read_text())

    def test_evidence_matches_current_source(self):
        self.assertEqual(self.manifest['source_sha256'],hashlib.sha256((ROOT/'src/butterfly-habitat.py').read_bytes()).hexdigest())
        self.assertTrue(self.report['geometry_pass'])
        self.assertTrue(self.report['motion_checked'])
        self.assertEqual(self.report['errors'],[])
        self.assertEqual(self.report['pairs_checked'],7381)
        self.assertEqual(len(self.report['motion']),6)

    def test_hardware_and_panel_inventory(self):
        self.assertEqual(collections.Counter(i['kind'] for i in self.manifest['items']),
                         {'printed':15,'mesh':5,'screw':51,'nut':51})
        self.assertEqual(collections.Counter(f['length'] for f in self.manifest['fasteners']),{10:45,16:6})
        self.assertEqual(len(self.manifest['panels']),5)
        for panel in self.manifest['panels']:
            self.assertEqual(len(panel['holes']),8)
        for f in self.manifest['fasteners']:
            self.assertEqual(f['engagement'],4)
            self.assertGreaterEqual(f['tip_beyond_nut'],.5)
        self.assertEqual(len(list((C/'stl').glob('*.stl'))),15)
        self.assertFalse(any('snap' in p.name for p in (C/'stl').iterdir()))

    def test_true_clearances_and_webs(self):
        for name,gap in self.report['joint_clearances_mm'].items():
            self.assertAlmostEqual(gap,.30 if name.startswith(('door','rail')) else .25,places=5)
        self.assertGreaterEqual(min(self.report['critical_webs_mm'].values()),1.6)
        for part in self.report['parts'].values():
            self.assertGreater(part['first_layer_area_mm2'],200)

    def test_exported_meshes_have_closed_oriented_connected_surfaces(self):
        for path in sorted((C/'stl').glob('*.stl'))+sorted((C/'coupons').glob('*.stl')):
            with self.subTest(part=path.name):
                triangles=read_stl(path); edges=collections.defaultdict(list); volume=0
                for i,(a,b,c) in enumerate(triangles):
                    volume+=(a[0]*(b[1]*c[2]-b[2]*c[1])+a[1]*(b[2]*c[0]-b[0]*c[2])+a[2]*(b[0]*c[1]-b[1]*c[0]))/6
                    for v,w in [(a,b),(b,c),(c,a)]:
                        edges[tuple(sorted((v,w)))].append((i,v<w))
                self.assertGreater(volume,0)
                adjacency=collections.defaultdict(set)
                for occurrences in edges.values():
                    self.assertEqual(len(occurrences),2)
                    (a,direction),(b,other)=occurrences
                    self.assertNotEqual(direction,other)
                    adjacency[a].add(b); adjacency[b].add(a)
                seen={0}; queue=[0]
                while queue:
                    for n in adjacency[queue.pop()]-seen: seen.add(n); queue.append(n)
                self.assertEqual(len(seen),len(triangles))
                points=[v for t in triangles for v in t]
                mins=[min(v[i] for v in points) for i in range(3)]
                spans=[max(v[i] for v in points)-mins[i] for i in range(3)]
                self.assertTrue(all(abs(v)<1e-4 for v in mins))
                self.assertLessEqual(max(spans[:2])+10,256)

    def test_slices_match_exported_parts(self):
        results=json.loads((C/'slicing/results.json').read_text())
        self.assertEqual(len(results),15)
        for r in results:
            self.assertEqual(r['exit_code'],0)
            self.assertTrue(r['gcode_present'])
            self.assertEqual(r['stl_sha256'],hashlib.sha256((C/'stl'/(r['part']+'.stl')).read_bytes()).hexdigest())

    def test_physical_verification_is_not_inferred(self):
        self.assertEqual(self.report['status'],'engineering candidate')
        self.assertEqual(self.report['physical'],'pending')


if __name__=='__main__': unittest.main()
