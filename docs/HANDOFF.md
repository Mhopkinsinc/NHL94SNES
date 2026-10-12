# Handoff

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- bank80_8000 and bank80_9000 are source (MATCH); the other 254 segments are incbin. bank80_A000 now starts at $809FF5
  (two incbins: the last 11 bytes of bank80_9000.bin, then bank80_A000.bin).
- `src/inc/snes_regs.asm` (from 93S) and `src/ram94snes.asm` are included at the top of `src/nhl94snes.asm`.
- bank80_8000 still has many auto `CODE_` labels and raw RAM addresses: no 93S/94G match, left for a naming pass.
- bank80_9000: math, sine, sound driver commands and the heap, named from what the code does. Left raw: the direct-page
  math scratch ($00-$0B, $3E-$46), $07E1/$07E2 (bit 6 of $07E2 makes the fraction multiplies skip the mode 7 multiplier) and
  $07E5 (decremented around SPCUploadBlock). The sound command numbers are the driver's; their meaning needs the SPC side.
- bank80_A000 opens with a word table at $809FF5 read by its own code (`lda.l $809FF5,x`), and its code reads
  ByteBitMasks (`and.l $809FED,x`).
- Next: segment bank80_A000 (see `SEGMENT_AGENT.md`, `PROMPT.md`).

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc` (gitignored). `Extracted/` and `output/` are generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
