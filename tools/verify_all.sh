#!/bin/sh
# verify_all.sh: fresh extract, full build, then every segment against its ROM slice. Usage: tools/verify_all.sh
# Deletes the old output first; fails on any assembler error, missing output or byte difference. The last line is MATCH or FAIL.
cd "$(dirname "$0")/.."
rm -rf Extracted output
fail=0
./build.sh >/tmp/nhl94snes_build.log 2>&1
grep -qiE 'error' /tmp/nhl94snes_build.log && { echo "ASM ERRORS"; fail=1; }
tail -1 /tmp/nhl94snes_build.log | grep -qx MATCH || { echo "TOP:"; tail -15 /tmp/nhl94snes_build.log; fail=1; }
[ -s output/nhl94snes.sfc ] || { echo "TOP NO BIN"; fail=1; }
for f in src/bank*_*.asm; do
  s=$(basename "$f" .asm)
  r=$(sh tools/verify_segment.sh "$s" 2>&1 | tail -1)
  [ "$r" = "$s: MATCH" ] || { echo "$r"; fail=1; }
done
[ $fail = 0 ] && echo MATCH || { echo FAIL; exit 1; }
