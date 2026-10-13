#!/usr/bin/env python3
# prebuild.py: run before every build (build.sh, build.ps1, tools/verify_all.sh).
# Usage: python3 tools/prebuild.py
# The ROM must be present (and the right version): the build compares its output with it. If the ROM is missing or wrong,
# stops with the path, file name, SHA-1 and size it must have.
import hashlib, os, sys

GAME = "NHL '94 (Super Nintendo)"
ROM = {'label': "NHL '94 SNES retail (USA, header title \"NHL '94\", version 1.0)", 'file': 'lst/nhl94snes.sfc',
       'sha1': '10dcd21be9c5542e82b0b94473bf5ff569b36cf5', 'size': 0x100000}
# ---------------------------------------------------------------------------------------------
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

def sha1_of(data): return hashlib.sha1(data).hexdigest()
def size_text(n):
    unit = f'{n // 0x100000} MB' if n >= 0x100000 else f'{n // 1024} KB'
    return f'{n} bytes (0x{n:X}, {unit})'

def stop(lines):
    print('', file=sys.stderr)
    print('*** BUILD STOPPED: ROM file needed ***', file=sys.stderr)
    print('\n'.join(lines), file=sys.stderr)
    print('', file=sys.stderr)
    print(f'ROMs are not included in the repo. Use your own dump of the {GAME} cartridge,', file=sys.stderr)
    print('saved under exactly that file name (no copier header), then run the build again.', file=sys.stderr)
    print('', file=sys.stderr)
    sys.exit(1)

# The ROM this build needs.
rom_path = os.path.join(ROOT, ROM['file'])
block = [f"  {ROM['label']}",
         f'    Put it at:  {rom_path}',
         f"                ({ROM['file']} in the repo folder)",
         f"    SHA-1:      {ROM['sha1']}",
         f"    Size:       {size_text(ROM['size'])}"]
if not os.path.exists(rom_path):
    stop(['This build needs this ROM, exactly the version shown:'] + block)
data = open(rom_path, 'rb').read()
if sha1_of(data) != ROM['sha1'] or len(data) != ROM['size']:
    stop([f'Found {rom_path}, but it is not the right ROM:',
          f'    its SHA-1 is {sha1_of(data)}, size {size_text(len(data))}.',
          '    (a bad dump, a hack, another revision, or a file with a 512-byte copier header)',
          'This build needs this ROM, exactly the version shown:'] + block)

print('prebuild: ROM OK.')
