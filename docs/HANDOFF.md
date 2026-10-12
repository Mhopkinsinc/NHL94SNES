# Handoff

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- bank80_8000 to bank80_C000 are source (MATCH); the rest are incbin. bank80_C000 runs from $80C001 to $80D000;
  bank80_D000 starts at $80D001 (incbin from byte 1).
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
  word $10FB LZ, $46FB pairs, $30FB Huffman, $7AFB DecompressRLE). $80B07E, $80B389, $80B394, $80B724 and $80B8AE have no
  direct caller found; the Vault names DecompressHuffman LoadGameSetupScreen, which does not fit the code. The OAM high
  table masks it reads at $80E67C-$80E68B are in bank80_E000.
- bank80_C000: the Huffman decoder's long-code handlers and bit readers (auto labels), DecompressRLE, Decompress,
  SoundDriver (SPC700 bytes as db; the SPC side is not disassembled), then the shootout. The shootout routines and RAM
  with a 94G counterpart take its names; the rounds loop ($80C81C, called from bank $9F), the screen drawing and the
  menu RAM ($1D81 shootout on, $1D89, $1DB9 cursor, $1D9B/$1DA3/$1DA7/$1DAB list scroll, $7E3468 redraw) are raw/auto.
  $178E/$1790 decide the shootout but are used elsewhere too; not named. $80D004 (called by ShooterSelectList after each
  cursor move) is in bank80_D000.
- Next: segment bank80_D000 (see `SEGMENT_AGENT.md`, `PROMPT.md`).

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc` (gitignored). `Extracted/` and `output/` are generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
