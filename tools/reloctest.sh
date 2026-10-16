#!/bin/sh
# reloctest.sh [SHIFT|retail] [INPUT]: run two ROMs in Mesen 2 with the same input (default tools/reloctest/game.txt) and
# compare their PPU and APU state every 10 frames (tools/reloctest.lua). Prints SAME, or the first frames that differ.
#   SHIFT (default 256): the 2 MB build as is, against the same build with SHIFT filler bytes after the org of every
#     bank that has %RelocShift() (the bank needs SHIFT bytes free). A difference means some ROM address in src/ is still
#     a number. A multiple of 256 keeps every page crossing, so both run the same cycles and end each load on the same frame.
#   retail: lst/nhl94snes.sfc against the 2 MB build: the expansion (header, moved tables) must not change the game.
# To find the cause of a difference: tools/reloctest/pclog.lua (first frame whose cycle count differs), dump.lua (memory),
# trace.lua (every instruction of a frame). MESEN= the Mesen.exe to use (its Lua scripts need "Allow access to I/O and OS
# functions"); default C:/tmp/mesen_rt/Mesen.exe.
cd "$(dirname "$0")/.."
MODE=${1:-256}; IN=${2:-tools/reloctest/game.txt}
MESEN=${MESEN:-/c/tmp/mesen_rt/Mesen.exe}
ASAR=asar; [ -x tools/bin/asar ] && ASAR=tools/bin/asar; [ -x tools/bin/asar.exe ] && ASAR=tools/bin/asar.exe
w() { if command -v cygpath >/dev/null; then cygpath -aw "$1"; else realpath "$1"; fi; }
O=output/reloctest; mkdir -p $O; rm -f $O/a.log $O/b.log
if [ "$MODE" = retail ]; then
	cp lst/nhl94snes.sfc $O/a.sfc
	$ASAR --symbols=wla --symbols-path=$O/b.sym src/nhl94snes.asm $O/b.sfc >/dev/null || { echo "build failed"; exit 1; }
else
	$ASAR --symbols=wla --symbols-path=$O/a.sym src/nhl94snes.asm $O/a.sfc >/dev/null || { echo "base build failed"; exit 1; }
	$ASAR -DRELOC_SHIFT=$MODE --symbols=wla --symbols-path=$O/b.sym src/nhl94snes.asm $O/b.sfc >/dev/null || { echo "shifted build failed"; exit 1; }
fi
for v in a b; do
	RT_INPUT="$(w "$IN")" RT_OUT="$(w $O/$v.log)" RT_EVERY=${RT_EVERY:-10} \
		"$MESEN" --testrunner --timeout=3000 "$(w $O/$v.sfc)" "$(w tools/reloctest.lua)" >/dev/null 2>&1 &
done
wait
[ -s $O/a.log ] && [ -s $O/b.log ] || { echo "a run produced no log"; exit 1; }
if cmp -s $O/a.log $O/b.log; then echo "SAME ($(wc -l < $O/a.log) samples, $MODE)"; exit 0; fi
diff $O/a.log $O/b.log | grep '^[<>]' | head -4
echo "DIFFER ($MODE)"; exit 1
