"""Habitat revision 0.11. Build and check are pure; export is explicit.

Run with FreeCAD/VibeCAD Python. Environment CLI is used because FreeCADCmd
consumes normal command-line options: HABITAT_ACTION=check|export|release.
"""
from __future__ import annotations
import json
import hashlib
import gzip
import math
import os
from dataclasses import dataclass, field
from itertools import combinations
from pathlib import Path
import FreeCAD as App
import Part

ROOT = Path(__file__).resolve().parents[1]
REVISION = '0.11.0'
V = App.Vector
WALL_FIT = 0.25
DOOR_FIT = 0.30
HARDWARE_RADIAL_FIT = 0.30
HOLE_R = 1.5 + HARDWARE_RADIAL_FIT
NUT_AF = 5.5
NUT_HEIGHT = 4.0  # Belmetric NN3SS: complete envelope INCLUDING nylon section
NUT_FIT = 0.20
HEAD_R = 2.75
HEAD_HEIGHT = 3.0
TOL = 0.001  # mm^3; never relaxed for hardware
BRIM = 5.0


def box(x, y, z, w, d, h):
    return Part.makeBox(w, d, h, V(x, y, z))


def cyl(p, r, length, axis=(0, 0, 1)):
    return Part.makeCylinder(r, length, V(*p), V(*axis))


def move(s, delta):
    s = s.copy()
    s.translate(V(*delta))
    return s


def hexagon(x, y, z, af, h):
    r = af / math.sqrt(3)
    pts = [V(x+r*math.cos(math.radians(30+60*i)), y+r*math.sin(math.radians(30+60*i)), z) for i in range(6)]
    return Part.Face(Part.makePolygon(pts+[pts[0]])).extrude(V(0,0,h))


def oriented(s, origin=(0,0,0), axis=(0,0,1)):
    s = s.copy()
    s.Placement = App.Placement(V(*origin), App.Rotation(V(0,0,1), V(*axis)))
    return s


def frame(w, h, t, border=20):
    return box(0,0,0,w,h,t).cut(box(border,border,-1,w-2*border,h-2*border,t+2))


def holes(w, h, inset=10):
    return [(inset,inset),(w/2,inset),(w-inset,inset),
            (inset,h/2),(w-inset,h/2),
            (inset,h-inset),(w/2,h-inset),(w-inset,h-inset)]


def transform(origin, x, y, z):
    m = App.Matrix()
    m.A11,m.A21,m.A31 = x
    m.A12,m.A22,m.A32 = y
    m.A13,m.A23,m.A33 = z
    m.A14,m.A24,m.A34 = origin
    return App.Placement(m)


def placed(s, p):
    s = s.copy()
    s.Placement = p.multiply(s.Placement)
    return s


@dataclass
class Item:
    name: str
    kind: str
    shape: object
    group: str
    # Rotation from assembly to print; normalize minimum bounds afterwards.
    print_rotation: object = field(default_factory=App.Rotation)


@dataclass
class Assembly:
    mesh_mm: float = 0.20
    mesh_measured: bool = False
    items: dict = field(default_factory=dict)
    fasteners: list = field(default_factory=list)
    panels: list = field(default_factory=list)
    mates: list = field(default_factory=list)

    def add(self, name, kind, shape, group, rotation=None):
        if name in self.items:
            raise ValueError(name)
        self.items[name] = Item(name, kind, shape.removeSplitter(), group, rotation or App.Rotation())

    def cut(self, name, cutter):
        self.items[name].shape = self.items[name].shape.cut(cutter).removeSplitter()

    def bolt(self, name, seat, axis, length, members, group, nut_access, stage):
        """Head seat, axis and length define screw, nut and tool from one datum.

        Thread envelopes use a clearance bore in the nut; we check geometric
        engagement separately. No threaded-pair collision exception is needed.
        """
        screw = cyl((0,0,0),1.5,length).fuse(cyl((0,0,-3),HEAD_R,3))
        screw = screw.cut(hexagon(0,0,-3.01,2.5,1.6))
        nut_start = length-5
        nut = hexagon(0,0,nut_start,NUT_AF,NUT_HEIGHT).cut(cyl((0,0,nut_start-.1),1.51,4.2))
        self.add(name+'-screw','screw',oriented(screw,seat,axis),group)
        self.add(name+'-nut','nut',oriented(nut,seat,axis),group)
        self.fasteners.append(dict(name=name, seat=list(seat), axis=list(axis), length=length,
                                   members=members, group=group, nut_access=nut_access,
                                   stage=stage, nut_start=nut_start, engagement=4.0,
                                   tip_beyond_nut=1.0))
        self.mates.append(dict(type='fastener',name=name,members=members))


def mesh_panel(a, name, w, h, placement, border=20, roof=False):
    t, c, fabric = 8.0, 3.0, a.mesh_mm
    panel = frame(w,h,t,border)
    clamp = move(frame(w,h,c,border),(0,0,t+fabric))
    cloth = box(1,1,t,w-2,h-2,fabric)
    pattern = holes(w,h,border/2)
    seat = t+fabric+c
    for x,y in pattern:
        through = cyl((x,y,-1),HOLE_R,seat+2)
        panel = panel.cut(through).cut(hexagon(x,y,-.1,NUT_AF+2*NUT_FIT,seat-5+.1))
        clamp = clamp.cut(through)
        cloth = cloth.cut(through)
    rotation = placement.Rotation.inverted()
    if roof:
        # Groove face up in print. Mesh pockets and grooves are on this side.
        rotation = App.Rotation(V(1,0,0),180).multiply(rotation)
    a.add(name,'printed',placed(panel,placement),name,rotation)
    a.add(name+'-clamp','printed',placed(clamp,placement),name,placement.Rotation.inverted())
    a.add(name+'-mesh','mesh',placed(cloth,placement),name)
    for i,(x,y) in enumerate(pattern):
        p = placement.multVec(V(x,y,seat))
        axis = placement.Rotation.multVec(V(0,0,-1))
        a.bolt(f'{name}-mesh-{i+1}',tuple(p),tuple(axis),10,[name,name+'-clamp'],name,
               'panel rear, before mounting panel', 'bench')
        nut=hexagon(x,y,seat-9,NUT_AF,4).cut(cyl((x,y,seat-9.1),1.51,4.2))
        a.items[f'{name}-mesh-{i+1}-nut'].shape=placed(nut,placement)
    a.panels.append(dict(name=name,w=w,h=h,border=border,holes=pattern,
                         placement=list(placement.toMatrix().A),mesh_mm=fabric))
    a.mates.append(dict(type='fabric_contact',panel=name,clamp=name+'-clamp',gap=fabric))
    return placement


def tongue(w):
    # 0.4 mm chamfer on the entering edge and first-layer relief.
    s = box(28,-3,2,w-56,3.2,4)
    edges = [e for e in s.Edges if abs(e.CenterOfMass.y+3)<1e-6]
    return s.makeChamfer(.4,edges)


def build(mesh_mm=.20, mesh_measured=False):
    if not .05 <= mesh_mm <= .40:
        raise ValueError('compressed mesh must be 0.05–0.40 mm; redesign stack otherwise')
    a = Assembly(mesh_mm,mesh_measured)
    H = 188-WALL_FIT
    side_span = 184-2*WALL_FIT
    # Local +Y is up, local +Z is outside the enclosure.
    pf = transform((0,8,8),(1,0,0),(0,0,1),(0,-1,0))
    pb = transform((200,192,8),(-1,0,0),(0,0,1),(0,1,0))
    pl = transform((8,192-WALL_FIT,8),(0,-1,0),(0,0,1),(-1,0,0))
    pr = transform((192,8+WALL_FIT,8),(0,1,0),(0,0,1),(1,0,0))
    roof_p = App.Placement(V(0,0,193),App.Rotation())
    mesh_panel(a,'back',200,H,pb,border=24)
    mesh_panel(a,'left',side_span,H,pl)
    mesh_panel(a,'right',side_span,H,pr)
    mesh_panel(a,'roof',200,200,roof_p,border=28,roof=True)
    front = box(0,0,0,200,H,8).cut(box(24,14,-1,152,158,10))
    a.add('front','printed',placed(front,pf),'front',pf.Rotation.inverted())
    for name,p,w in [('front',pf,200),('back',pb,200),('left',pl,side_span),('right',pr,side_span)]:
        a.items[name].shape = a.items[name].shape.fuse(placed(tongue(w),p)).removeSplitter()
    for name in ['front','back','left','right']:
        a.items[name].print_rotation=App.Rotation(V(1,0,0),180).multiply(a.items[name].print_rotation)
    # Slots on inward faces of front/back, open at the top for drop-in sides.
    for name,y in [('front',4),('back',192)]:
        for x in [2-WALL_FIT,194-WALL_FIT]:
            a.cut(name,box(x,y,24,4+2*WALL_FIT,4,173))
    # Side edge tongues: middle of wall thickness, stop short of bottom/top.
    for name,x in [('left',2),('right',194)]:
        s = a.items[name].shape
        for y in [4+WALL_FIT,191.75-WALL_FIT]:
            tab = box(x,y,24+WALL_FIT,4,4.25,172-2*WALL_FIT)
            # Lead-in at bottom of tab.
            edges=[e for e in tab.Edges if abs(e.CenterOfMass.z-(24+WALL_FIT))<1e-6]
            s=s.fuse(tab.makeChamfer(.4,edges))
        a.items[name].shape=s.removeSplitter()
    base=box(0,0,0,200,200,8)
    for x,y,w,d in [(28-WALL_FIT,2-WALL_FIT,144+2*WALL_FIT,4+2*WALL_FIT),
                      (28-WALL_FIT,194-WALL_FIT,144+2*WALL_FIT,4+2*WALL_FIT),
                      (2-WALL_FIT,36,4+2*WALL_FIT,128),
                      (194-WALL_FIT,36,4+2*WALL_FIT,128)]:
        base=base.cut(box(x,y,5-WALL_FIT,w,d,3.5))
    a.add('base','printed',base,'base')
    for x,y,w,d in [(-WALL_FIT,-WALL_FIT,200+2*WALL_FIT,8+2*WALL_FIT),
                      (-WALL_FIT,192-WALL_FIT,200+2*WALL_FIT,8+2*WALL_FIT),
                      (-WALL_FIT,8,8+2*WALL_FIT,184),
                      (192-WALL_FIT,8,8+2*WALL_FIT,184)]:
        a.cut('roof',box(x,y,192.9,w,d,3.1))
    # Four bottom retention screws and two independent roof retention screws.
    for name,y,access in [('front',14,1),('back',186,-1)]:
        for x in [40,160]:
            boss=box(x-6,7.5 if name=='front' else 178,8,12,14.5,14)
            a.items[name].shape=a.items[name].shape.fuse(boss).removeSplitter()
            bore=cyl((x,y,3),HOLE_R,17)
            a.cut('base',bore)
            a.cut('base',cyl((x,y,-.1),3.2,3.3))
            a.cut(name,bore)
            # Side-loading slot, flats capture torque; nut nylon faces screw tip.
            a.cut(name,box(x-2.95,y-3.5 if access==1 else 177.9,14.2,5.9,11.6,4.2))
            a.bolt(f'base-{name}-{x}',(x,y,3.2),(0,0,1),16,['base',name],name,
                   'inward boss slot, before wall installation','base')
    for x in [45,155]:
        y=14
        boss=box(x-6,7.5,182,12,14.5,11)
        a.items['front'].shape=a.items['front'].shape.fuse(boss).removeSplitter()
        bore=cyl((x,y,184.5),HOLE_R,17)
        a.cut('front',bore)
        # Nut bears against the upper slot face at z=190 under screw preload.
        a.cut('front',box(x-2.95,y-3.5,185.8,5.9,11.6,4.2))
        a.cut('roof',bore)
        for n in ['roof-clamp','roof-mesh']:
            a.cut(n,cyl((x,y,200.9),3.3,8))
        a.bolt(f'roof-{x}',(x,y,201),(0,0,-1),16,['roof','front'],'roof',
               'inward front boss slot before roof installation','roof')
        a.items[f'roof-{x}-nut'].group='front'
    # External door: 6 mm overlap on all four edges of the 152 x 160 aperture.
    pd=transform((18,-DOOR_FIT,16),(1,0,0),(0,0,1),(0,-1,0))
    mesh_panel(a,'door',164,170,pd,border=20)
    # Finger grip integrated into carrier, ahead of clamp, in the bottom border.
    grip=box(88,-20,18,24,9,4)
    a.items['door-clamp'].shape=a.items['door-clamp'].shape.fuse(grip).removeSplitter()
    outer=DOOR_FIT+8+mesh_mm+3
    # Rails retain outermost 4 mm; bolt heads remain outside the running strip.
    for name,left in [('rail-left',True),('rail-right',False)]:
        x=5 if left else 182+DOOR_FIT
        width=13-DOOR_FIT
        spine=box(x,-outer-DOOR_FIT,16,width,outer+DOOR_FIT,180)
        lip=box(5 if left else 178,-outer-DOOR_FIT-3,16,17,3.1,180)
        stop=box(5 if left else 166,-outer-DOOR_FIT-3,12,29,outer+DOOR_FIT+3,4)
        rail=spine.fuse(lip).fuse(stop).removeSplitter()
        entry=[e for e in rail.Edges if abs(e.CenterOfMass.z-196)<1e-6]
        rail=rail.makeChamfer(.4,entry)
        a.add(name,'printed',rail,'front',App.Rotation(V(1,0,0),90))
        sx=11.5 if left else 188.5
        for z in [48,152]:
            a.cut(name,cyl((sx,-30,z),3.2,27,(0,1,0)))
            a.cut(name,cyl((sx,-3.1,z),HOLE_R,11,(0,1,0)))
            a.cut('front',cyl((sx,-.1,z),HOLE_R,8.2,(0,1,0)))
            a.cut('front',oriented(hexagon(0,0,0,5.9,6.1),(sx,2,z),(0,1,0)))
            a.bolt(name+f'-{z}',(sx,-3,z),(0,1,0),10,[name,'front'],'front',
                   'front inside face before rails','rails')
    # Keeper pivots outside the track. Its hook clears the rail top as it turns.
    ky=-outer-DOOR_FIT-3
    keeper=box(6.5,ky-3,181,28.5,3,9).fuse(box(30,ky,186.3,5,6,3))
    a.add('keeper','printed',keeper,'keeper',App.Rotation(V(1,0,0),90))
    a.cut('keeper',cyl((11.5,ky-3.1,185),HOLE_R,3.2,(0,1,0)))
    a.cut('rail-left',cyl((11.5,ky-.1,185),HOLE_R,9,(0,1,0)))
    a.cut('rail-left',oriented(hexagon(0,0,0,5.9,-ky-1.9),(11.5,ky+2,185),(0,1,0)))
    a.bolt('keeper-pivot',(11.5,ky-3,185),(0,1,0),10,['keeper','rail-left'],'keeper',
           'rail inside face before mounting rail','rails')
    a.mates += [dict(type='sliding',members=['door','front','rail-left','rail-right'],
                     face_clearance=DOOR_FIT,travel=190,overlap=6),
                dict(type='locating',members=['base','front','back','left','right','roof'],
                     per_side_clearance=WALL_FIT)]
    return a


def print_shape(item):
    s=item.shape.copy()
    s.Placement=App.Placement(V(),item.print_rotation).multiply(s.Placement)
    b=s.BoundBox
    return move(s,(-b.XMin,-b.YMin,-b.ZMin))


def intersects(a,b):
    if not a.BoundBox.intersect(b.BoundBox):
        return 0.0
    return a.common(b).Volume


def swept(s,delta):
    """Exact translational sweep: union start solid and every swept boundary face."""
    v=V(*delta)
    pieces=[s]
    for face in s.Faces:
        try:
            p=face.extrude(v)
            if p.Volume > 1e-8:
                pieces.append(p)
        except Part.OCCError:
            pass  # Faces parallel to motion produce no volume.
    return pieces[0].multiFuse(pieces[1:]).removeSplitter()


def validate(a, motion=True):
    import MeshPart
    errors=[]
    report=dict(revision=REVISION,status='engineering candidate',parts={},
                pairs_checked=0,collisions=[],motion=[],fasteners=len(a.fasteners),
                mesh_measured=a.mesh_measured,motion_checked=motion,
                slicing='pending',physical='pending')
    for n,i in a.items.items():
        s=i.shape
        if not s.isValid() or len(s.Solids)!=1 or not s.isClosed():
            errors.append(f'{n}: invalid or disconnected CAD body')
        if i.kind=='printed':
            p=print_shape(i)
            b=p.BoundBox
            mesh=MeshPart.meshFromShape(Shape=p,LinearDeflection=.08,AngularDeflection=.2)
            good=mesh.isSolid() and mesh.countComponents()==1
            fits=max(b.XLength,b.YLength)+2*BRIM<=256 and b.ZLength<=256
            report['parts'][n]=dict(bbox=[b.XLength,b.YLength,b.ZLength],
                                    manifold=good,bed_with_brim=fits,triangles=mesh.CountFacets)
            layer=p.common(box(-1,-1,-.01,b.XLength+2,b.YLength+2,.21))
            report['parts'][n]['first_layer_area_mm2']=layer.Volume/.2
            if not good or not fits:
                errors.append(f'{n}: STL topology or bed fit failed')
    for (na,ia),(nb,ib) in combinations(a.items.items(),2):
        report['pairs_checked']+=1
        hit=intersects(ia.shape,ib.shape)
        if hit>TOL:
            report['collisions'].append(dict(a=na,b=nb,mm3=hit))
            errors.append(f'{na} / {nb}: {hit:.6f} mm3')
    # Tool diameter 5 mm, 40 mm shaft beyond head. Mesh is tightened on bench;
    # structural/rail/roof fasteners are tightened in final assembly.
    for f in a.fasteners:
        q=V(*f['seat']); d=V(*f['axis'])
        tool=cyl(tuple(q-d*3),2.5,40,tuple(-d))
        for n,i in a.items.items():
            if n in [f['name']+'-screw',f['name']+'-nut']:
                continue
            if f['stage']=='bench' and i.group!=f['group']:
                continue
            if intersects(tool,i.shape)>TOL:
                errors.append(f"tool access {f['name']} blocked by {n}")
        if f['nut_start']+4>f['length']-.5:
            errors.append(f"{f['name']}: nylon not fully engaged")
        # Check the actual insertion path into the receiving part, at its
        # specified assembly stage. The nut is preloaded before other panels.
        if f['stage']=='bench':
            receiver=f['members'][0]
            delta=tuple(d*12)
        elif f['name'].startswith('base-'):
            receiver=f['members'][1]
            delta=(0,12 if receiver=='front' else -12,0)
        elif f['name'].startswith('roof-'):
            receiver='front'
            delta=(0,12,0)
        else:
            receiver=f['members'][1]
            delta=(0,24,0)
        path=swept(a.items[f['name']+'-nut'].shape,delta)
        if intersects(path,a.items[receiver].shape)>TOL:
            errors.append(f"nut insertion {f['name']} blocked by {receiver}")
        if a.items[f['name']+'-nut'].shape.distToShape(a.items[receiver].shape)[0]>1e-6:
            errors.append(f"{f['name']}: nut does not bear against its seat")
        head_contact=min(a.items[f['name']+'-screw'].shape.distToShape(a.items[m].shape)[0]
                         for m in f['members'])
        if head_contact>1e-6:
            errors.append(f"{f['name']}: screw head is not seated")
        # A screw must be insertable through every member before engaging nut.
        path=swept(a.items[f['name']+'-screw'].shape,tuple(-d*25))
        for member in f['members']:
            if intersects(path,a.items[member].shape)>TOL:
                errors.append(f"screw insertion {f['name']} blocked by {member}")
    # Dimensions of critical manufactured webs, excluding intentional chamfers.
    report['critical_webs_mm']={
        'mesh_nut_seat': 2-a.mesh_mm,
        'base_under_head_seat': 8-3.2,
        'structural_boss_slot_sides': (12-5.9)/2,
        'base_screw_tip_cap': 22-19.2,
        'roof_screw_tip_cap': 185-182,
        'rail_screw_pocket_to_wall_slot': 11.5-2.95-6.25,
        'rail_lip': 3, 'keeper_pivot_edge': 4-HOLE_R,
        'wall_tongue': 4, 'front_above_aperture': 195.75-180,
        'roof_above_groove': 201-196,
    }
    if min(report['critical_webs_mm'].values())<1.6-1e-8:
        errors.append('critical web below 1.6 mm')
    report['joint_clearances_mm']={}
    for side in ['left','right']:
        for wall in ['front','back']:
            distance=a.items[side].shape.distToShape(a.items[wall].shape)[0]
            report['joint_clearances_mm'][side+'-'+wall]=distance
            if abs(distance-WALL_FIT)>1e-5:
                errors.append(f'{side}/{wall}: locating clearance drifted')
    door_middle=a.items['door'].shape.common(box(0,-30,70,200,40,40))
    rear=door_middle.distToShape(a.items['front'].shape)[0]
    report['joint_clearances_mm']['door-rear']=rear
    if abs(rear-DOOR_FIT)>1e-5:
        errors.append('door rear running clearance drifted')
    for rail in ['rail-left','rail-right']:
        gap=door_middle.distToShape(a.items[rail].shape)[0]
        report['joint_clearances_mm'][rail]=gap
        if abs(gap-DOOR_FIT)>1e-5:
            errors.append(f'{rail}: lateral running clearance drifted')
    # Check uninterrupted 3 mm contact bands beside all four opening edges.
    for p in a.panels:
        b,w,h=p['border'],p['w'],p['h']
        m=App.Matrix(*p['placement'])
        placement=App.Placement(m)
        bands=[box(b-3,b-3,7.99,w-2*b+6,3,.01),
               box(b-3,h-b,7.99,w-2*b+6,3,.01),
               box(b-3,b,7.99,3,h-2*b,.01),
               box(w-b,b,7.99,3,h-2*b,.01)]
        for band in bands:
            expected=band.Volume
            for name,z in [(p['name'],0),(p['name']+'-mesh',.01),
                           (p['name']+'-clamp',.01+a.mesh_mm)]:
                sample=placed(move(band,(0,0,z)),placement)
                if abs(sample.common(a.items[name].shape).Volume-expected)>TOL:
                    errors.append(f'{name}: interrupted fabric contact band')
    if motion:
        # Unlock keeper before removing door; roof stays installed.
        unlocked=a.items['keeper'].shape.copy()
        unlocked.rotate(V(11.5,0,185),V(0,1,0),-90)
        # Conservative full disc for the rear plate (it only touches the rail
        # face), and exact arc-bounded 90 degree sweep of the rectangular hook.
        ky=-DOOR_FIT-8-a.mesh_mm-3-DOOR_FIT-3
        disc=cyl((11.5,ky-3,185),25,3,(0,1,0)).cut(
            cyl((11.5,ky-3.1,185),HOLE_R,3.2,(0,1,0)))
        def hp(x,z): return V(11.5+x,ky,185+z)
        lo=hp(18.5,1.3); br=hp(23.5,1.3); hi=hp(23.5,4.3)
        endhi=hp(-4.3,23.5); endcorner=hp(-4.3,18.5); endlo=hp(-1.3,18.5)
        root=math.sqrt(2)
        edges=[Part.makeLine(lo,br),Part.makeLine(br,hi),
               Part.Arc(hi,hp((23.5-4.3)/root,(23.5+4.3)/root),endhi).toShape(),
               Part.makeLine(endhi,endcorner),Part.makeLine(endcorner,endlo),
               Part.Arc(endlo,hp((18.5-1.3)/root,(18.5+1.3)/root),lo).toShape()]
        hook_sweep=Part.Face(Part.Wire(edges)).extrude(V(0,6,0))
        for n,i in a.items.items():
            if n!='keeper' and any(intersects(s,i.shape)>TOL for s in [disc,hook_sweep]):
                errors.append(f'keeper turn blocked by {n}')
        tasks=[('door removal',['door'],190,{'keeper'}),
               ('roof removal',['roof'],20,set()),
               ('left installation',['left'],200,{'roof','right','door','keeper'}),
               ('right installation',['right'],200,{'roof','left','door','keeper'}),
               ('front installation',['front'],200,{'roof','left','right','door','keeper','back'}),
               ('back installation',['back'],200,{'roof','left','right','door','keeper','front'})]
        for label,groups,travel,absent in tasks:
            moving=[(n,i) for n,i in a.items.items() if i.group in groups]
            # Retention bolts removed before panel motion. Mesh bolts stay installed.
            removed={f['name']+'-screw' for f in a.fasteners if f['stage'] in ['base','roof']}
            moving=[(n,i) for n,i in moving if n not in removed]
            stationary=[(n,i.shape) for n,i in a.items.items()
                        if i.group not in groups+list(absent) and n not in removed]
            if label=='door removal':
                stationary.append(('keeper-unlocked',unlocked))
                stationary.extend((n,a.items[n].shape) for n in ['keeper-pivot-screw','keeper-pivot-nut'])
            hits=[]
            for n,i in moving:
                sweep=swept(i.shape,(0,0,travel))
                for other,s in stationary:
                    hit=intersects(sweep,s)
                    if hit>TOL:
                        hits.append(f'{n} / {other}: {hit:.6f}')
            report['motion'].append(dict(name=label,travel_mm=travel,collisions=hits))
            errors.extend(label+': '+hit for hit in hits)
    report['errors']=errors
    report['geometry_pass']=not errors
    return report


def export(a, out, report):
    """Explicit candidate export. Never called by construction or validation."""
    import MeshPart
    out=Path(out)
    for d in ['stl','step','assembly','templates','coupons','views']:
        (out/d).mkdir(parents=True,exist_ok=True)
    for n,i in a.items.items():
        if i.kind=='printed':
            p=print_shape(i)
            p.exportStep(str(out/'step'/f'habitat-{n}.step'))
            mesh=MeshPart.meshFromShape(Shape=p,LinearDeflection=.08,AngularDeflection=.2)
            mesh.write(str(out/'stl'/f'habitat-{n}.stl'))
            import Mesh
            reread=Mesh.Mesh(str(out/'stl'/f'habitat-{n}.stl'))
            if not reread.isSolid() or reread.countComponents()!=1:
                raise ValueError(f'{n}: exported STL failed readback')
    Part.makeCompound([i.shape for i in a.items.values()]).exportStep(str(out/'assembly'/'habitat-assembly.step'))
    manifest=dict(revision=REVISION,mesh_mm=a.mesh_mm,mesh_measured=a.mesh_measured,
                  source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  items=[dict(name=n,kind=i.kind,group=i.group,
                              placement=list(i.shape.Placement.toMatrix().A),
                              print_rotation=list(i.print_rotation.Q)) for n,i in a.items.items()],
                  fasteners=a.fasteners,panels=a.panels,mates=a.mates)
    (out/'assembly'/'manifest.json').write_text(json.dumps(manifest,indent=2))
    (out/'validation.json').write_text(json.dumps(report,indent=2))
    bom=['item,quantity,length_mm']
    for length in sorted({f['length'] for f in a.fasteners}):
        bom.append(f"M3 A2 socket-head screw,{sum(f['length']==length for f in a.fasteners)},{length}")
    bom.append(f'M3 A2 nyloc nut NN3SS,{len(a.fasteners)},4')
    (out/'hardware.csv').write_text('\n'.join(bom)+'\n')
    review=out/'required-review.json'
    if not review.exists():
        review.write_text(json.dumps(dict(source_sha256=manifest['source_sha256'],
                          mesh_compressed_mm=a.mesh_mm,slicer_review_pass=False,
                          wall_thickness_review_pass=False,physical_fit_pass=False,
                          reviewer='',notes='Record actual observations; do not infer fit from CAD.'),indent=2))
    for p in a.panels:
        w,h=p['w'],p['h']
        svg=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}mm" height="{h}mm" viewBox="0 0 {w} {h}">',
             f'<rect x="1" y="1" width="{w-2}" height="{h-2}" fill="none" stroke="black" stroke-width="0.2"/>']
        for x,y in p['holes']:
            svg.append(f'<circle cx="{x}" cy="{y}" r="1.8" fill="none" stroke="black" stroke-width="0.2"/>')
        if p['name']=='roof':
            for x in [45,155]: svg.append(f'<circle cx="{x}" cy="14" r="3.3" fill="none" stroke="black" stroke-width="0.2"/>')
        svg.append(f'<text x="25" y="25" font-size="4">{p["name"]} mesh — print at 100%</text></svg>')
        (out/'templates'/f'{p["name"]}-mesh.svg').write_text('\n'.join(svg))
    export_coupons(a,out)
    export_views(a,out)


def export_coupons(a,out):
    """Coupons are cropped production geometry, including the actual pockets."""
    import MeshPart
    samples=[('corner',box(-25,-25,0,90,90,65),['base','front','left','left-clamp']),
             ('rail',box(0,-25,38,40,34,25),['front','rail-left','door','door-clamp']),
             ('mesh-fastener',box(176,188,8,24,30,25),['back','back-clamp'])]
    report={}
    for label,clip,names in samples:
        for name in names:
            item=a.items[name]
            s=item.shape.common(clip).removeSplitter()
            if not s.isValid() or len(s.Solids)!=1:
                raise ValueError(f'coupon {label}-{name} must be one solid')
            p=print_shape(Item(name,'printed',s,label,item.print_rotation))
            mesh=MeshPart.meshFromShape(Shape=p,LinearDeflection=.08,AngularDeflection=.2)
            if not mesh.isSolid() or mesh.countComponents()!=1:
                raise ValueError(f'coupon {label}-{name}: invalid mesh')
            stem=f'{label}-{name}'
            mesh.write(str(out/'coupons'/f'{stem}.stl'))
            p.exportStep(str(out/'coupons'/f'{stem}.step'))
            report[stem]=dict(source_part=name,valid=True,bbox=[p.BoundBox.XLength,p.BoundBox.YLength,p.BoundBox.ZLength])
    (out/'coupons'/'manifest.json').write_text(json.dumps(report,indent=2))


def export_views(a,out):
    """Orthographic triangle projection from the SAME assembly instances.

    Painter ordering is for inspection only; solid booleans provide the proof.
    Mesh is drawn translucent so the frame and hardware remain visible.
    """
    import html
    modes={'assembled':{},'door-removal':{'door':(0,0,190)},
           'roof-removal':{'roof':(0,0,50)},
           'exploded':{'roof':(0,0,65),'door':(0,-60,0),
                       'left':(-45,0,0),'right':(45,0,0),
                       'back':(0,45,0),'front':(0,-25,0)}}
    colors={'base':(186,178,159),'front':(205,201,181),'back':(187,195,170),
            'left':(180,192,171),'right':(180,192,171),'roof':(161,192,185),
            'door':(123,176,153),'keeper':(227,159,92)}
    for mode,offsets in modes.items():
        triangles=[]
        for n,item in a.items.items():
            s=move(item.shape,offsets.get(item.group,(0,0,0)))
            if mode=='door-removal' and n=='keeper':
                s.rotate(V(11.5,0,185),V(0,1,0),-90)
            vs,fs=s.tessellate(.4)
            rgb=colors.get(item.group,(170,185,195))
            if item.kind in ['screw','nut']: rgb=(85,96,110)
            if n.endswith('-clamp'): rgb=tuple(max(0,c-22) for c in rgb)
            for face in fs:
                points=[vs[i] for i in face]
                # Camera at (1,-1,0.8), upright Z.
                projected=[((p.x+p.y)*.707, (p.x-p.y)*.36-p.z*.86) for p in points]
                depth=sum(p.x-p.y+p.z*.8 for p in points)/3
                normal=(points[1]-points[0]).cross(points[2]-points[0])
                shade=.78+.22*abs(normal.z)/(normal.Length or 1)
                color='#'+''.join(f'{int(c*shade):02x}' for c in rgb)
                triangles.append((depth,projected,color,.13 if item.kind=='mesh' else 1,n,
                                  [p.x-p.y+p.z*(.72/.86) for p in points]))
        xs=[p[0] for t in triangles for p in t[1]]; ys=[p[1] for t in triangles for p in t[1]]
        xmin,ymin=min(xs)-12,min(ys)-25
        w,h=max(xs)-xmin+12,max(ys)-ymin+12
        svg=[f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="{xmin} {ymin} {w} {h}">',
             f'<rect x="{xmin}" y="{ymin}" width="{w}" height="{h}" fill="#faf9f4"/>',
             f'<text x="{xmin+8}" y="{ymin+12}" font-size="7" font-family="sans-serif">Habitat {REVISION} · {mode} · candidate</text>']
        for depth,pts,color,opacity,n,depths in sorted(triangles,key=lambda t:t[0]):
            coords=' '.join(f'{x:.3f},{y:.3f}' for x,y in pts)
            ds=' '.join(f'{d:.4f}' for d in depths)
            svg.append(f'<polygon data-depths="{ds}" points="{coords}" fill="{color}" opacity="{opacity}"><title>{html.escape(n)}</title></polygon>')
        svg.append('</svg>')
        with gzip.open(out/'views'/f'{mode}.svgz','wt') as stream:
            stream.write('\n'.join(svg))


def main():
    action=os.environ.get('HABITAT_ACTION','check')
    if action not in ['check','export','release']:
        raise ValueError('HABITAT_ACTION must be check, export or release')
    a=build(float(os.environ.get('HABITAT_MESH_MM','.20')),os.environ.get('HABITAT_MESH_MEASURED')=='1')
    report=validate(a,motion=os.environ.get('HABITAT_SKIP_MOTION')!='1')
    print(json.dumps(report,indent=2),flush=True)
    if action in ['export','release']:
        if not report['geometry_pass'] or not report['motion_checked']:
            raise RuntimeError('Export blocked by geometry failures')
        if action=='release':
            evidence=Path(os.environ.get('HABITAT_RELEASE_EVIDENCE',str(ROOT/'candidate'/'required-review.json')))
            review=json.loads(evidence.read_text())
            source_hash=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
            if (not a.mesh_measured or review.get('mesh_compressed_mm')!=a.mesh_mm
                or review.get('source_sha256')!=source_hash
                or review.get('slicer_review_pass') is not True
                or review.get('wall_thickness_review_pass') is not True
                or not review.get('reviewer') or not review.get('notes')):
                raise RuntimeError('Release blocked: measured mesh and revision-matched slicer/thickness review required')
            candidate=ROOT/'candidate'
            manifest=json.loads((candidate/'assembly'/'manifest.json').read_text())
            slices=json.loads((candidate/'slicing'/'results.json').read_text())
            printed={f'habitat-{n}' for n,i in a.items.items() if i.kind=='printed'}
            if (manifest['source_sha256']!=source_hash or manifest['mesh_mm']!=a.mesh_mm
                or manifest['mesh_measured'] is not True or {s['part'] for s in slices}!=printed):
                raise RuntimeError('Release blocked: candidate or slice inventory is stale')
            for result in slices:
                digest=hashlib.sha256((candidate/'stl'/(result['part']+'.stl')).read_bytes()).hexdigest()
                if result['exit_code'] or not result.get('gcode_present') or result['stl_sha256']!=digest:
                    raise RuntimeError('Release blocked: unsuccessful or stale slice')
            report['status']='fit verified' if review.get('physical_fit_pass') is True else 'digitally verified'
            report['slicing']='reviewed'
            report['physical']='passed' if review.get('physical_fit_pass') is True else 'pending'
        export(a,os.environ.get('HABITAT_OUTPUT',str(ROOT/('release' if action=='release' else 'candidate'))),report)
    if report['errors']:
        raise RuntimeError(f"{len(report['errors'])} validation failures")


if __name__=='__main__':
    main()
