# Handoff

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- Banks $80 to $87, and bank88_8000 to bank88_D000, are source (MATCH); the rest are incbin.
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
  bank81_B000 to bank81_F000 continue it (`incbin "../Extracted/data/TeamLogos.spr.huf":<start>..<end>`; bank81_F000
  starts at byte 17442 and ends the asset at $81FE45);
  after it, $81FE45-$81FFFF is a song (DATA8_81FE45) from TeamSongs (bank80_D000): header, track offsets, TRAK chunks
  "left"/"right". The note stream format (commands $D9-$EA of the player in bank80_A000) is not decoded yet; the second
  chunk's size byte ($CA) reaches past the bank end, but its track ends (command $D9) inside the bank.
- TeamSongs ($80DA56, six long pointers per team, $FFFFFFFF none) and DefaultSongs ($80DCF6) are read by the music code
  at $9C9B5F: slot A of the home team ($1C98), else a random DefaultSongs entry. The other long pointer tables in bank80_D000
  (DATA8_80D324, DATA8_80DD16) are not identified yet.
- `tools/snesgfx.py blocks` finds 238 packed blocks in the ROM (204 Huffman, 28 LZ, 4 RLE, 2 pairs), each unpacking to
  the size in its header; the 51 that code loads directly (lda #bank / lda #address before Decompress) are all among them.
- bank82_8000: SpriteFrames ($828000), the main sprite set: an offset table of 976 frames (dd, raw offsets until the
  frames are source; then `dd SpriteFrameN-SpriteFrames` can replace them), then frames in order, contiguous, in the ROM halves
  of banks $82-$8E. Each bank's frames are a data asset (SpriteFramesXX.bin in tools/extract.py; bank $82: $828F40-$82FEA8);
  the source writes each frame's header and pieces and includes its tiles from the asset. Frames cross 4 KB edges, so segment
  edges move to frame boundaries (bank82_9000 starts at $82908B). `tools/spriteframes.py frames FROM TO` writes the source
  of the frames that start in a range and prints where the next segment starts; `info` gives each bank's frames and its
  asset range for tools/extract.py; `table` writes the offset table. Header words +4..+$A and bytes +$12..+$15 are not traced.
  After the frames, each bank ends with a small Huffman block (bank $82: $82FEA9-$82FFF6, $3A0 bytes unpacked).
- SpriteFrames banks: before the first segment of a bank, add its asset (`tools/spriteframes.py info`) to the ASSETS list
  in tools/extract.py.
- Centre ice logos: the rink loader $9BC17C reads the per-team table at $9C83B7 (8 bytes per home team $1C98: long pointer to
  the logo tiles, then to the logo map). The tiles are linear 4bpp packed for DecompressHuffman (converted to planar by
  $9B85C2; `tools/snesgfx.py tiles/map --linear`), the map is not packed (width, height, a word, then map words, which
  $9BC1D5 pastes into the rink map with palette 5). Most of the tiles are in bank $9A; a few sit at bank ends after the
  sprite frames (team index: CenterIceTilesHFD (9) at $82FEA9, CenterIceTilesPIT (17) at $83FF47, CenterIceTilesDAL (5) at $84FF38, CenterIceTilesVAN (23) at $86FE78; still incbin: 3 at $8DFF3D, 21 at $97FE85, 13 at $98FECB, 15 at $99FEC0). Team index = the logo order of
  TeamLogoSprites.
- $9DCD53 is a table of long pointers read at $9DC9DD and $9DCC65 as (team $1C98 * 26 + $A5) * 4: 28 rows of 26 packed
  entries that are unpacked and converted with $9B85C2 (likely player photos; not checked yet). After the 28 rows,
  entries point at 16-word tables: $9AF47C, $85FFDF (DATA8_85FFDF), $9AEA5C, ... at $20 steps, which share their first
  words (palettes?); no reader of these found yet.
- DATA8_87FF91 (bank87_F000): an LZ block, unpacked a 10 x 12 byte map after three words (10, 12, 16); $9DB6D7 unpacks it
  to $7F0000 and then unpacks $9ADEE0 to $7F4000 and $91B188 to $7F5000; what reads the map is not traced.
- Next: segment bank88_E000, from $88E155 (`tools/spriteframes.py frames 88E155 88F000`; see `SEGMENT_AGENT.md`, `PROMPT.md`).

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc` (gitignored). `Extracted/` and `output/` are generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
