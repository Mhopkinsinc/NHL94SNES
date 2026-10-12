#!/bin/sh
# Check the ROM (tools/prebuild.py), assemble src/nhl94snes.asm with asar and verify byte-identical to lst/nhl94snes.sfc.
cd "$(dirname "$0")"
python3 tools/prebuild.py || exit 1
mkdir -p output
ASAR=asar; [ -x tools/bin/asar ] && ASAR=tools/bin/asar
if command -v sha1sum >/dev/null; then SHA="sha1sum"; else SHA="shasum -a 1"; fi
rm -f output/nhl94snes.sfc
$ASAR --fix-checksum=off --symbols=wla --symbols-path=output/nhl94snes.sym src/nhl94snes.asm output/nhl94snes.sfc || { echo "MISMATCH (assembly failed)"; exit 1; }
ref=$($SHA lst/nhl94snes.sfc | cut -d' ' -f1); out=$($SHA output/nhl94snes.sfc | cut -d' ' -f1)
echo "ref $ref"; echo "out $out"
if [ "$ref" = "$out" ]; then echo MATCH; else echo MISMATCH; cmp -l lst/nhl94snes.sfc output/nhl94snes.sfc | head -20; exit 1; fi
