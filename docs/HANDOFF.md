# Handoff

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- Bank $80 (bank80_8000 to bank80_F000) and bank81_8000 to bank81_B000 are source (MATCH); the rest are incbin.
- Data assets: `tools/extract.py` has an `ASSETS` list (name, first address, end exclusive) and cuts each block into
  `Extracted/data/` at prebuild; the source includes them by name (see SEGMENT_AGENT.md, Segment rules).
- `src/macros/snes94.mac` (included before the banks) holds the `String` macro (length word counting itself, then text),
  as 93S `snes93.mac`.
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
  word $FB10 LZ, $FB46 pairs, $FB30 Huffman, $FB7A DecompressRLE). $80B07E, $80B389, $80B394, $80B724 and $80B8AE have no
  direct caller found; the Vault names DecompressHuffman LoadGameSetupScreen, which does not fit the code. The OAM high
  table masks DrawSprite reads (`and.w $E67C,x`, `ora.w $E680,x` ... with the data bank at $7E) are in WRAM at
  $7EE67C-$7EE68B; what fills them is not traced yet.
- bank80_C000: the Huffman decoder's long-code handlers and bit readers (auto labels), DecompressRLE, Decompress,
  SoundDriver (SPC700 bytes as db; the SPC side is not disassembled), then the shootout. The shootout routines and RAM
  with a 94G counterpart take its names; the rounds loop ($80C81C, called from bank $9F), the screen drawing and the
  menu RAM ($1D81 shootout on, $1D89, $1DB9 cursor, $1D9B/$1DA3/$1DA7/$1DAB list scroll, $7E3468 redraw) are raw/auto.
  $178E/$1790 decide the shootout but are used elsewhere too; not named.
- bank80_D000: the rest of the ShooterSelectList screen ($0D47 rating column, $1D9B cursor row, $1DA7 first row), then
  data read from other banks. Its tables are labelled with auto names where code references them (Vault DATA8_ names);
  the penalty/stoppage table at DATA8_80D3EB (strings with variable trailing data) and the 48-byte records from $80DDA0
  (they continue into bank80_E000) are plain db until their readers are disassembled.
- bank80_E000: data only. The records end at $80E2E0; then the copyright lines, CreditTitles / CreditNames (read from bank
  $9D) with their strings, long pointer tables DATA8_80E6C1 / DATA8_80E6FD / DATA8_80E73D (read from bank $9C), and $FF
  fill to $80F000 written as `padbyte $FF` / `pad $80F000`.
- bank80_F000: $FF fill, DATA8_80FF00 (the OAM high table masks; DrawSprite reads the same values from WRAM $7EE67C, and
  neither the copy into WRAM nor a reader of this table is found yet), the internal header (checksum $9B52, complement
  $64AD, 1 MB, LoROM/FastROM) and the vectors (NMI, Reset, IRQ; COP/BRK/ABORT are $0000).
- bank81_8000: the start of IceRinkTiles, LZ-packed rink tiles ($818000-$81ABDD) that $9FB6F7 and $9FE7AD unpack to
  $7F0000 and copy to VRAM $1000. The rink map is the packed block at $92E053 (header words: width $30, height $71, then
  $0308, not traced; it renders with `tools/snesgfx.py map '$92E053:6' --tiles '$818000' --width 48`). Its
  palette is not found yet.
- bank81_A000 ends IceRinkTiles at $81ABDE and starts TeamLogoSprites ($81ABDE-$81FE44, Huffman, $7C00 bytes unpacked):
  a sprite set the team setup code in bank $9D unpacks to $7F7800 and draws with DrawSprite (frame = team, palettes from
  the long pointer table at $9C8497). `tools/snesgfx.py sprites '$81ABDE' --pal-table 9C8497` renders all of its frames.
  bank81_B000 to bank81_F000 continue it (`incbin "../Extracted/data/TeamLogos.spr.huf":<start>..<end>`; bank81_C000
  starts at byte 5154);
  after it, $81FE45-$81FFFF is other data (it holds "TRAK" strings) that bank81_F000 has to look at.
- `tools/snesgfx.py blocks` finds 238 packed blocks in the ROM (204 Huffman, 28 LZ, 4 RLE, 2 pairs), each unpacking to
  the size in its header; the 51 that code loads directly (lda #bank / lda #address before Decompress) are all among them.
- Next: segment bank81_C000 (see `SEGMENT_AGENT.md`, `PROMPT.md`).

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc` (gitignored). `Extracted/` and `output/` are generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
