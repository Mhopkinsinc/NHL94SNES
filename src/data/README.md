# src/data/

The data the bank files include by name. Graphics and sound binaries are not committed. `tools/prebuild.py` extracts
them from the ROM into `Extracted/data/gfx/` and `Extracted/data/sound/` (gitignored) and writes
`Extracted/.extract-complete.json` last. The asm `incbin`s those files, so the build stays byte-identical.
`tools/extract.py` lists every binary asset with its ROM range (`ASSETS`). `python3 tools/extract.py lst/nhl94snes.sfc --check`
compares `Extracted/` with the ROM.

- `gfx/`: graphics source. Packed and unpacked tiles, maps, palettes and sprite sets. The binary is in `Extracted/data/gfx/`.
- `sound/`: sound source. The upload blocks are in `Extracted/data/sound/`.
- `text/`: the text tables as source, one file per table named after its label (`incsrc "data/text/<Label>.asm"` at its
  place in the bank file). Strings are written with the `String` macro (length word, then the text); records with
  position codes ($9F, $AF or $BF, then two position bytes) keep their length word.
- `teamdata94s.asm`: the team database (TeamList, the team records with their players, playoffseats), as
  NHLPA93SNES `teamdata93s.asm`; bank9C_A000 includes it.

Where a header is already spelled as `db`/`dw`, the `incbin` is the rest of that asset (`incbin "../../../Extracted/data/gfx/<name>":<start>..<end>`, decimal, end exclusive). IceRinkTiles and TeamLogoSprites are that shape. SpriteFrames keeps one `Extracted` file per bank; the source writes each frame's header and pieces and includes that frame's tiles by range. The file is still a ROM cut of the frame region, not one `.chr` per frame.
`tools/snesgfx.py` unpacks the packed formats and renders tiles, maps and sprite sets to PNG. `tools/songwav.py` plays the organ songs (TeamSongs / DefaultSongs) and decodes the sample blocks to WAV.

The file extension gives the format:

| Extension | Format |
|-----------|--------|
| `.chr` | SNES 4bpp planar tiles, not packed |
| `.chr.lz`, `.chr.huf`, `.chr.pairs` | SNES 4bpp tiles packed for DecompressLZ (format word $FB10), DecompressHuffman ($FB30), DecompressPairs ($FB46) |
| `.lin.huf`, `.lin.lz`, `.lin.pairs` | Linear 4bpp tiles (converted to planar by $9B85C2), packed for DecompressHuffman, DecompressLZ, DecompressPairs. The team centre ice logos and the player photos |
| `.spr` | A DrawSprite sprite set, not packed |
| `.spr.huf` | A DrawSprite sprite set packed for DecompressHuffman |
| `.map.lz`, `.map.huf` | Map words packed for DecompressLZ, DecompressHuffman |
| `.map.rle` | Map words (or map bytes after a $0010 header word) packed for DecompressRLE ($FB7A) |
| `.pal.lz`, `.pal.huf`, `.pal.rle` | Colours packed for DecompressLZ, DecompressHuffman, DecompressRLE |
| `.lz`, `.huf` | Packed for DecompressLZ, DecompressHuffman, contents not identified yet |
| `SpriteFramesXX.bin` | The SpriteFrames frames of bank $XX, not packed. The source writes their headers and pieces, and includes their tiles from this file |
| `.spc` | A BRR sound sample for SPCUploadBlock: big-endian loop point and length (multiples of the 9-byte BRR block), then the BRR blocks |

An asset takes the name of the label that includes it (`MenuBackTiles.chr.lz`); one not identified yet is named by its address (`DATA8_XXXXXX.<format>`).
