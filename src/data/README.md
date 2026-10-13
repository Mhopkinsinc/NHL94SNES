# src/data/

The data the `src/bank*.asm` files include by name. `gfx/` and `sound/` hold binary assets (`incbin`); each file holds
the exact ROM bytes, so the build stays byte-identical. `tools/extract.py` lists every binary asset with its ROM range
(`ASSETS`); `python3 tools/extract.py lst/nhl94snes.sfc --check` compares the files with the ROM, and without `--check`
writes them again.

- `gfx/`: graphics. Packed and unpacked tiles, maps, palettes and sprite sets, and the SpriteFrames tiles.
- `sound/`: blocks for the sound CPU.
- `text/`: the text tables as source, one file per table named after its label (`incsrc "data/text/<Label>.asm"` at its
  place in the bank file). Strings are written with the `String` macro (length word, then the text); records with
  position codes ($9F, $AF or $BF, then two position bytes) keep their length word.
- `teamdata94s.asm`: the team database (TeamList, the team records with their players, playoffseats), as
  NHLPA93SNES `teamdata93s.asm`; bank9C_A000 includes it.

A block that still spans segment files is included in pieces (`incbin "data/gfx/<name>":<start>..<end>`, decimal,
end exclusive). Once a bank is in `src/banks/`, the asset is one data file: the header fields it knows are db/dw,
and one `incbin` covers the rest of that asset (IceRinkTiles, TeamLogoSprites).
`tools/snesgfx.py` unpacks the packed formats and renders tiles, maps and sprite sets to PNG.

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
| `.spc` | A block for SPCUploadBlock: big-endian sound RAM address and length, then the bytes for the sound CPU |

An asset not identified yet is named by its address (`DATA8_XXXXXX.<format>`).
