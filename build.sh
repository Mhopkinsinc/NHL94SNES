#!/bin/sh
# Check the ROM (tools/prebuild.py), then assemble src/nhl94snes.asm with asar twice:
#   output/nhl94snes.sfc  the game, 2 MB (banks $A0-$BF are the expansion), checksum fixed: this is the ROM to play.
#   output/retail.sfc     -DRETAIL, the retail 1 MB layout, compared with lst/nhl94snes.sfc. The last line is MATCH while
#                         the game's own code and data are unchanged (refactors, names, comments); a change to the game
#                         makes it MISMATCH, which is expected then.
cd "$(dirname "$0")"
python3 tools/prebuild.py || exit 1
mkdir -p output
ASAR=asar; [ -x tools/bin/asar ] && ASAR=tools/bin/asar
if command -v sha1sum >/dev/null; then SHA="sha1sum"; else SHA="shasum -a 1"; fi
rm -f output/nhl94snes.sfc output/retail.sfc
$ASAR --symbols=wla --symbols-path=output/nhl94snes.sym src/nhl94snes.asm output/nhl94snes.sfc || { echo "MISMATCH (assembly failed)"; exit 1; }
echo "built output/nhl94snes.sfc ($(wc -c < output/nhl94snes.sfc) bytes)"
$ASAR --fix-checksum=off -DRETAIL --symbols=wla --symbols-path=output/retail.sym src/nhl94snes.asm output/retail.sfc || { echo "MISMATCH (retail assembly failed)"; exit 1; }
ref=$($SHA lst/nhl94snes.sfc | cut -d' ' -f1); out=$($SHA output/retail.sfc | cut -d' ' -f1)
echo "ref $ref"; echo "out $out (retail layout)"
if [ "$ref" = "$out" ]; then echo MATCH; else echo MISMATCH; cmp -l lst/nhl94snes.sfc output/retail.sfc | head -20; exit 1; fi
