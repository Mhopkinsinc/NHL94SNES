#!/bin/sh
# reloctest.sh [SHIFT] [INPUT]: build the ROM as is and with SHIFT (default 256) filler bytes at the start of every bank
# that has %RelocShift() (a bank needs SHIFT bytes free; a multiple of 256 keeps every page crossing, so the cycle counts
# and the frame each load ends on stay the same), run both in Mesen 2 with the same input (default tools/reloctest/game.txt) and compare the
# PPU and APU state every 10 frames (tools/reloctest.lua). Prints SAME, or the first frame where the two differ.
# A difference means some ROM address in src/ is still a number. MESEN= the Mesen.exe to use (its Lua scripts need
# "Allow access to I/O and OS functions"); default C:/tmp/mesen_rt/Mesen.exe.
cd "$(dirname "$0")/.."
SHIFT=${1:-256}; IN=${2:-tools/reloctest/game.txt}
MESEN=${MESEN:-/c/tmp/mesen_rt/Mesen.exe}
ASAR=asar; [ -x tools/bin/asar ] && ASAR=tools/bin/asar; [ -x tools/bin/asar.exe ] && ASAR=tools/bin/asar.exe
w() { if command -v cygpath >/dev/null; then cygpath -aw "$1"; else realpath "$1"; fi; }
mkdir -p output/reloctest
$ASAR --fix-checksum=off src/nhl94snes.asm output/reloctest/base.sfc >/dev/null || { echo "base build failed"; exit 1; }
$ASAR --fix-checksum=off -DRELOC_SHIFT=$SHIFT --symbols=wla --symbols-path=output/reloctest/shift.sym src/nhl94snes.asm output/reloctest/shift.sfc >/dev/null || { echo "shifted build failed"; exit 1; }
for v in base shift; do
	RT_INPUT="$(w "$IN")" RT_OUT="$(w output/reloctest/$v.log)" RT_EVERY=${RT_EVERY:-10} \
		"$MESEN" --testrunner --timeout=3000 "$(w output/reloctest/$v.sfc)" "$(w tools/reloctest.lua)" >/dev/null 2>&1 &
done
wait
[ -s output/reloctest/base.log ] && [ -s output/reloctest/shift.log ] || { echo "a run produced no log"; exit 1; }
if cmp -s output/reloctest/base.log output/reloctest/shift.log; then echo "SAME ($(wc -l < output/reloctest/base.log) samples, shift $SHIFT)"; exit 0; fi
diff output/reloctest/base.log output/reloctest/shift.log | grep '^[<>]' | head -4
echo "DIFFER (shift $SHIFT)"; exit 1
