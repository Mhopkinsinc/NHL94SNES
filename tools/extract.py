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
# .spr = a DrawSprite sprite set, not packed. .map.lz = map words packed for DecompressLZ.
# .chr.huf = tiles packed for DecompressHuffman. .lin.pairs = linear 4bpp tiles packed for DecompressPairs.
# .map.huf = map words packed for DecompressHuffman. .chr.pairs = tiles packed for DecompressPairs.
# .lin.lz = linear 4bpp tiles (converted to planar by $9B85C2) packed for DecompressLZ.
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
    ('DATA8_91F2F9.spc', 0x91F2F9, 0x91FFFF),
    ('DATA8_928000.spc', 0x928000, 0x9293F3),
    ('DATA8_9293F3.spc', 0x9293F3, 0x92A7B9),
    ('LetterSprites.spr', 0x92A7B9, 0x92BB61),
    ('DATA8_92BB61.spc', 0x92BB61, 0x92CECD),
    ('DATA8_92CECD.spc', 0x92CECD, 0x92E053),
    ('IceRink.map.lz', 0x92E053, 0x92F18A),
    ('DATA8_92F18A.spc', 0x92F18A, 0x92FFB0),
    ('DATA8_938000.chr.huf', 0x938000, 0x9390FA),
    ('DATA8_9390FA.spc', 0x9390FA, 0x93A18D),
    ('DATA8_93A18D.spc', 0x93A18D, 0x93B217),
    ('DATA8_93B217.lin.pairs', 0x93B217, 0x93C20B),
    ('DATA8_93C20B.spc', 0x93C20B, 0x93D187),
    ('DATA8_93D187.spc', 0x93D187, 0x93DFAD),
    ('DATA8_93DFAD.spc', 0x93DFAD, 0x93ED31),
    ('DATA8_93FAB1.spc', 0x93FAB1, 0x93FFFB),
    ('DATA8_948000.chr.lz', 0x948000, 0x948D6F),
    ('DATA8_948D6F.spc', 0x948D6F, 0x949A00),
    ('DATA8_949A00.lz', 0x949A00, 0x94A662),
    ('DATA8_94A662.spc', 0x94A662, 0x94B287),
    ('DATA8_94B287.spc', 0x94B287, 0x94BEAC),
    ('DATA8_94BEAC.spc', 0x94BEAC, 0x94CABF),
    ('DATA8_94CABF.spc', 0x94CABF, 0x94D6A5),
    ('DATA8_94D6A5.chr.huf', 0x94D6A5, 0x94E225),
    ('DATA8_94E225.spc', 0x94E225, 0x94ED96),
    ('DATA8_94ED96.spc', 0x94ED96, 0x94F8EC),
    ('DATA8_94F8EC.spr.huf', 0x94F8EC, 0x94FFF9),
    ('DATA8_958000.spc', 0x958000, 0x958ABD),
    ('DATA8_958ABD.spc', 0x958ABD, 0x959490),
    ('DATA8_959490.spc', 0x959490, 0x959E48),
    ('DATA8_959E48.spc', 0x959E48, 0x95A7F7),
    ('SmallLetterSprites.spr', 0x95A7F7, 0x95B15C),
    ('DATA8_95B15C.spc', 0x95B15C, 0x95BA96),
    ('DATA8_95BA96.chr.lz', 0x95BA96, 0x95C376),
    ('DATA8_95C376.spc', 0x95C376, 0x95CBEA),
    ('DATA8_95CBEA.spc', 0x95CBEA, 0x95D3F2),
    ('DATA8_95D3F2.spc', 0x95D3F2, 0x95DB8E),
    ('DATA8_95E304.chr.lz', 0x95E304, 0x95EA63),
    ('DATA8_95EA63.spc', 0x95EA63, 0x95F1AE),
    ('DATA8_95F1AE.chr.lz', 0x95F1AE, 0x95F8C6),
    ('DATA8_95F8C6.lz', 0x95F8C6, 0x95FF9B),
    ('DATA8_95FF9B.map.huf', 0x95FF9B, 0x960000),
    ('DATA8_968000.spc', 0x968000, 0x968646),
    ('DATA8_968C02.lz', 0x968C02, 0x969190),
    ('DATA8_969190.spc', 0x969190, 0x9696E3),
    ('DATA8_9696E3.spc', 0x9696E3, 0x969C09),
    ('DATA8_96A103.chr.pairs', 0x96A103, 0x96A5E5),
    ('DATA8_96A5E5.chr.lz', 0x96A5E5, 0x96AA64),
    ('DATA8_96AA64.spc', 0x96AA64, 0x96AEBB),
    ('DATA8_96B2CF.chr.lz', 0x96B2CF, 0x96B6CD),
    ('DATA8_96BABD.chr.lz', 0x96BABD, 0x96BEA5),
    ('DATA8_96C61F.map.lz', 0x96C61F, 0x96C9CE),
    ('DATA8_96D7AC.lin.lz', 0x96D7AC, 0x96DB0E),
    ('DATA8_96DE60.spc', 0x96DE60, 0x96E1A9),
    ('DATA8_96FD81.lin.huf', 0x96FD81, 0x970000),
    ('DATA8_9782F8.spc', 0x9782F8, 0x9785F0),
    ('DATA8_978E95.lin.huf', 0x978E95, 0x979162),
    ('DATA8_979406.lin.huf', 0x979406, 0x97969D),
    ('DATA8_979931.lin.huf', 0x979931, 0x979BC5),
    ('DATA8_979BC5.lin.huf', 0x979BC5, 0x979E57),
    ('DATA8_979E57.lin.huf', 0x979E57, 0x97A0E8),
    ('DATA8_97A0E8.lin.huf', 0x97A0E8, 0x97A374),
    ('DATA8_97A374.lin.huf', 0x97A374, 0x97A600),
    ('DATA8_97A600.lin.huf', 0x97A600, 0x97A887),
    ('DATA8_97A887.lin.huf', 0x97A887, 0x97AB0A),
    ('DATA8_97AB0A.lin.huf', 0x97AB0A, 0x97AD8B),
    ('DATA8_97AD8B.lin.huf', 0x97AD8B, 0x97B00C),
    ('DATA8_97B00C.lin.huf', 0x97B00C, 0x97B28D),
    ('DATA8_97B28D.lin.huf', 0x97B28D, 0x97B50D),
    ('DATA8_97BA0D.lin.huf', 0x97BA0D, 0x97BC8C),
    ('DATA8_97BC8C.lin.huf', 0x97BC8C, 0x97BF0A),
    ('DATA8_97BF0A.lin.huf', 0x97BF0A, 0x97C188),
    ('DATA8_97C188.lin.huf', 0x97C188, 0x97C405),
    ('DATA8_97C405.lin.huf', 0x97C405, 0x97C682),
    ('DATA8_97C682.lin.huf', 0x97C682, 0x97C8FE),
    ('DATA8_97C8FE.lin.huf', 0x97C8FE, 0x97CB79),
    ('DATA8_97CDF3.lin.huf', 0x97CDF3, 0x97D06C),
    ('DATA8_97D06C.lin.huf', 0x97D06C, 0x97D2E2),
    ('DATA8_97D2E2.lin.huf', 0x97D2E2, 0x97D556),
    ('DATA8_97D557.lin.huf', 0x97D557, 0x97D7CC),
    ('DATA8_97D7CC.lin.huf', 0x97D7CC, 0x97DA41),
    ('DATA8_97DCB5.lin.huf', 0x97DCB5, 0x97DF28),
    ('DATA8_97DF28.lin.huf', 0x97DF28, 0x97E19B),
    ('DATA8_97E40B.lin.huf', 0x97E40B, 0x97E67A),
    ('DATA8_97E8E8.lin.huf', 0x97E8E8, 0x97EB52),
    ('DATA8_97EB52.lin.huf', 0x97EB52, 0x97EDBC),
    ('DATA8_97EDBC.lin.huf', 0x97EDBC, 0x97F023),
    ('DATA8_97F023.lin.huf', 0x97F023, 0x97F28A),
    ('DATA8_97F28A.lin.huf', 0x97F28A, 0x97F4F1),
    ('DATA8_97F757.lin.huf', 0x97F757, 0x97F9BC),
    ('DATA8_97F9BC.lin.huf', 0x97F9BC, 0x97FC21),
    ('CenterIceTBL.lin.huf', 0x97FE85, 0x97FFF0),
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
