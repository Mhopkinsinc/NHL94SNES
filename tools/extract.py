#!/usr/bin/env python3
# extract.py: cut the ROM into the 4 KB segment files that the incbin segments include, and into the data assets
# (packed graphics and other blocks) that the source includes by name.
# Usage: python3 tools/extract.py lst/nhl94snes.sfc   (tools/prebuild.py runs it when needed)
# Writes Extracted/segments/bankXX_YYYY.bin and Extracted/data/<asset>, then Extracted/.extract-complete.json last.
import hashlib, json, os, shutil, sys
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
rom = open(sys.argv[1], 'rb').read()
out = os.path.join(ROOT, 'Extracted'); shutil.rmtree(out, ignore_errors=True)
os.makedirs(os.path.join(out, 'segments'))
# Data assets: file under Extracted/data/, first ROM address, end address (exclusive). The extension gives the format:
# .chr.lz = SNES 4bpp tiles packed for DecompressLZ (format word $FB10, unpacked size, stream);
# .spr.huf = a DrawSprite sprite set packed for DecompressHuffman (format word $FB30). tools/snesgfx.py unpacks and renders them.
# SpriteFramesXX.bin = the SpriteFrames frames of bank $XX, not packed (the source writes their headers and pieces, and includes
# their tiles from it).
# .lin.huf = linear 4bpp tiles (converted to planar by $9B85C2) packed for DecompressHuffman: the team centre ice logos.
# DATA8_XXXXXX.<format> = a packed block not identified yet, named by its address (.lz: DecompressLZ; .pal.lz: colours).
# .chr = SNES 4bpp planar tiles, not packed.
# .spc = a block for SPCUploadBlock: big-endian sound RAM address and length, then the bytes for the sound CPU.
ASSETS = [
    ('IceRink.chr.lz', 0x818000, 0x81ABDE),
    ('TeamLogos.spr.huf', 0x81ABDE, 0x81FE45),
    ('SpriteFrames82.bin', 0x828F40, 0x82FEA9),
    ('CenterIceHFD.lin.huf', 0x82FEA9, 0x82FFF7),
    ('SpriteFrames83.bin', 0x838000, 0x83FF47),
    ('CenterIcePIT.lin.huf', 0x83FF47, 0x83FFFB),
    ('SpriteFrames84.bin', 0x848000, 0x84FF38),
    ('CenterIceDAL.lin.huf', 0x84FF38, 0x84FFF9),
    ('SpriteFrames85.bin', 0x858000, 0x85FFDF),
    ('SpriteFrames86.bin', 0x868000, 0x86FE78),
    ('CenterIceVAN.lin.huf', 0x86FE78, 0x86FFFB),
    ('SpriteFrames87.bin', 0x878000, 0x87FF91),
    ('DATA8_87FF91.lz', 0x87FF91, 0x87FFFB),
    ('SpriteFrames88.bin', 0x888000, 0x88FFC6),
    ('SpriteFrames89.bin', 0x898000, 0x89FFC7),
    ('DATA8_89FFC7.pal.lz', 0x89FFC7, 0x89FFF4),
    ('SpriteFrames8A.bin', 0x8A8000, 0x8AFF7A),
    ('SpriteFrames8B.bin', 0x8B8000, 0x8BFE74),
    ('SpriteFrames8C.bin', 0x8C8000, 0x8CFDEC),
    ('DATA8_8CFDEC.lin.huf', 0x8CFDEC, 0x8D0000),
    ('SpriteFrames8D.bin', 0x8D8000, 0x8DFF3D),
    ('CenterIceCGY.lin.huf', 0x8DFF3D, 0x8DFFFC),
    ('SpriteFrames8E.bin', 0x8E8000, 0x8ED897),
    ('DATA8_8ED897.spc', 0x8ED897, 0x8EFD2B),
    ('DATA8_8F8000.spc', 0x8F8000, 0x8FBB26),
    ('DATA8_8FBB26.spc', 0x8FBB26, 0x8FDD32),
    ('DATA8_8FFE74.lin.huf', 0x8FFE74, 0x8FFFEF),
    ('DATA8_908000.chr', 0x908000, 0x90A120),
    ('DATA8_90A120.spc', 0x90A120, 0x90C20C),
    ('DATA8_90E08C.spc', 0x90E08C, 0x90FDE2),
    ('DATA8_90FDE2.lin.huf', 0x90FDE2, 0x90FFFF),
    ('DATA8_918000.spc', 0x918000, 0x9199D2),
    ('DATA8_9199D2.spc', 0x9199D2, 0x91B188),
    ('DATA8_91B188.spr.huf', 0x91B188, 0x91C7A6),
    ('DATA8_91C7A7.spc', 0x91C7A7, 0x91DDAD),
    ('DATA8_91DDAD.chr.lz', 0x91DDAD, 0x91F2F9),
]
def rom_offset(a): return ((a >> 16) & 0x7F) * 0x8000 + (a & 0x7FFF)
files = []
os.makedirs(os.path.join(out, 'data'))
for name, start, end in ASSETS:
    path = 'data/' + name
    open(os.path.join(out, path), 'wb').write(rom[rom_offset(start):rom_offset(end)])
    files.append({'path': path, 'size': rom_offset(end) - rom_offset(start)})
for o in range(0, len(rom), 0x1000):
    name = f'segments/bank{0x80 + o // 0x8000:02X}_{0x8000 + o % 0x8000:04X}.bin'
    open(os.path.join(out, name), 'wb').write(rom[o:o + 0x1000])
    files.append({'path': name, 'size': 0x1000})
marker = {'romSha1': hashlib.sha1(rom).hexdigest(),
          'extractorSha1': hashlib.sha1(open(__file__, 'rb').read()).hexdigest(), 'files': files}
json.dump(marker, open(os.path.join(out, '.extract-complete.json'), 'w'), indent=1)
print(f'ROM: {sys.argv[1]} sha1 {marker["romSha1"]}')
print(f'Extracted {len(files) - len(ASSETS)} slices and {len(ASSETS)} assets')
