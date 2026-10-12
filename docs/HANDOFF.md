# Handoff

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- bank80_8000 to bank80_B000 are source (MATCH); the rest are incbin. bank80_B000 runs from $80B001 to
  $80C000; bank80_C000 starts at $80C001 (incbin from byte 1, split at CODE_80C069, which a branch in bank80_B000 targets).
- `src/inc/snes_regs.asm` (from 93S) and `src/ram94snes.asm` are included at the top of `src/nhl94snes.asm`.
- bank80_8000 still has many auto `CODE_` labels and raw RAM addresses: no 93S/94G match, left for a naming pass.
- bank80_9000: math, sine, sound driver commands and the heap, named from what the code does. Left raw: the direct-page
  math scratch ($00-$0B, $3E-$46) and $07E1/$07E2 (bit 6 of $07E2 makes the fraction multiplies skip the mode 7
  multiplier). The sound command numbers are the driver's; their meaning needs the SPC side.
- bank80_A000: the music/sound effect player. Entry points, tables and four RAM flags are named; the sequencer internals
  (voice allocation, track command interpreter $D9-$EA, envelopes) and the per-voice RAM tables ($0804-$0A09) are auto
  labels / raw addresses for a naming pass. It ends with InitSprites, SpriteFrameStart and SpriteFrameEnd.
- bank80_B000: sprites and decompression. OAM buffer RAM is named; the tile cache tables ($2540-$2E40 in bank $7E, $07BA
  count, $07C0-$07D0 work) and the two allocators ($2F40/$2FB9 blocks of four tiles, $3032/$3093 single tiles) are raw,
  and their routines are auto labels with comments. The decompressors are called from the dispatcher at $80C373 (format
  word $10FB LZ, $46FB pairs, $30FB Huffman, $7AFB at $80C2F3). DecompressHuffman continues in bank80_C000 (bit reader at
  $80C1B0, long-code handlers from $80C000) and bank80_C000 jumps back through its tables; the Vault names it
  LoadGameSetupScreen, which does not fit the code. $80B07E, $80B389, $80B394, $80B724 and $80B8AE have no direct caller
  found. The OAM high table masks it reads at $80E67C-$80E68B are in bank80_E000.
- Next: segment bank80_C000 (see `SEGMENT_AGENT.md`, `PROMPT.md`).

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc` (gitignored). `Extracted/` and `output/` are generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
