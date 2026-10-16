# Extending the ROM

The default build is a 2 MB ROM you can change: every ROM address in `src/` is a label, every bank checks its own size,
and banks `$A0-$BF` are free. `-DRETAIL` still builds the retail 1 MB layout byte for byte.

## Builds

| Output | How | What |
|---|---|---|
| `output/nhl94snes.sfc` | `./build.sh` (Windows `build.ps1`) | The game, 2 MB, checksum fixed. This is the ROM to play. |
| `output/retail.sfc` | the same run, `-DRETAIL` | The retail layout, compared with `lst/nhl94snes.sfc`. MATCH while the game's own code and data are unchanged; a change to the game makes it MISMATCH, which is expected then. |

`tools/verify_all.sh` is the strict check (every segment of the retail layout). Use it for refactors, names and comments.

## Where things go

- Each bank file in `src/banks/` is one `org` at the start of the bank, `%RelocShift()`, the `incsrc` lines in ROM order,
  then `FreeSpaceXX:` and `%PadTo(<next bank>)`. There is no other `org` inside a bank: code runs on from the line before.
- Add code or data to a bank by adding lines (or an `incsrc`) before its `FreeSpaceXX` label. Everything after it in the
  bank moves, and labels follow. If the bank overflows, `%PadTo` (an `assert`) or asar's bank-border check stops the build.
- Free space in the retail banks (2 MB build): `$80` about 6 KB (before `OAMHighMasks`, which stays at `$80FF00`),
  `$9A` 2.6 KB, `$9B` 12.7 KB, `$9C` 1.7 KB, `$9D` 3 KB (the photo tables moved to `$A0`), `$9E` 1.2 KB, `$9F` 1.2 KB.
  Banks `$81-$99` are full. The `FreeSpaceXX` labels in `output/nhl94snes.sym` give the exact start.
- Banks `$A0-$BF` (32 KB each, 992 KB) are the expansion: `bA0_expansion.asm`, `bA1_bBF_free.asm`. Code there is
  called with `jsl` / `jml`; data there is read with long addressing (`lda.l Label,x`, or `[dp]` with `#Label>>16`).
- To call new code from a routine: `jsl.l NewThing` (it ends with `rtl`). A routine that is reached with `jsr` / `jmp`
  must stay in the bank of its callers.
- To move a table out of a full bank: check every reference first (`grep`). Long ones (`lda.l Table,x`, `#Table>>16`) can
  move; `.w` ones (`lda.w Table,x`) only work in the bank the data bank register points at. PlayerPhotoTable and
  PhotoPaletteTable went from `$9D` to `$A0` this way.

## Rules

- Write ROM addresses as labels, never as numbers: `#Label`, `#Label>>16` for its bank, `Label+n` inside a table,
  `.local>>16` for a table next to the code. A number stays the same when the data moves.
- `jsr.w` / `jmp.w` / `lda.w` with a label take only its low word. The label must be in the bank the code runs in (or the
  bank DBR holds). `python3 tools/bankcheck.py` lists any that are not; the code today has none.
- Word pointer tables (`dw Label`) hold no bank: the reader supplies it (`#Table>>16`, `phk` / `plb`). Keep a table and
  what it points at in one bank.
- `org` and `pad` never warn when they overwrite: asar writes the later bytes over the earlier ones. Use `%PadTo(addr)`
  (it asserts first) when something must sit at a fixed address, as `OAMHighMasks` and the header do.

## Checks

- `python3 tools/romrefs.py`: numeric literals in `src/` that look like ROM addresses (`--all` adds weak candidates;
  most of those are masks and coordinates).
- `python3 tools/bankcheck.py`: `.w` references across banks.
- `sh tools/reloctest.sh`: builds the 2 MB ROM as is and with 256 filler bytes after the org of every bank (`-DRELOC_SHIFT`),
  runs both in Mesen 2 with `tools/reloctest/game.txt` (intro, menus, matchups, a period of CPU against CPU) and
  compares VRAM, CGRAM, OAM and SPC RAM every 10 frames. SAME means no address on that path is still a number.
  256 keeps every page crossing, so both builds run the same cycles; a difference is a real one, even one cycle late.
- `sh tools/reloctest.sh retail`: the retail ROM against the 2 MB build (the expansion must not change the game).
- The test needs Mesen 2 with "Allow access to I/O and OS functions" for Lua (a private copy: `MESEN=/path/Mesen.exe`).
  To find a difference: `tools/reloctest/pclog.lua` (first frame whose cycle count differs), `dump.lua` (memory at a
  frame, WRAM every frame), `trace.lua` (every instruction of a frame), then compare the two runs.

## Done

- The 38 `org`s inside banks were no-ops (each one checked with an `assert`) and are gone; fills at bank ends are `%PadTo`.
- Numeric ROM addresses found and written as labels (all MATCH):
  - pointer banks: 70 `lda.w #$009C`-style banks (team data, local tables, palettes, maps, credits, crowd) as `#Label>>16`;
  - pointers: PhotoPaletteTable, playoffseats, PlayoffBracketMap+6, SetScore `.5`, dirtab+2, the SpriteFrames base in
    GetHot / GetFrameHot;
  - compares: GameSfxTable entries in StartSoundVoice (`.organl`, `.organr`, `.clap`) and StopVoice (`.stream` -
    `.streamlast`), SPA animation bounds in findpc / checkplcoll / check4check / assgoalie / ShotMode, songs in Opening /
    PlayoffScreen, `asspenalty` in doinput.
- 2 MB: header `$0B`, banks `$A0-$BF`, photo tables in `$A0`.
- `reloctest.sh 256` and `reloctest.sh retail`: SAME for all 24000 frames.

## Still open

- The relocation test covers one path. Screens it does not reach can still hold a numeric address: options and setup
  menus, player cards, rosters, edit lines, stats, standings, playoffs, shootout, pause menu, instant replay, the end of a
  period and of a game, the credits. Each needs an input script in `tools/reloctest/` and a run of both modes.
- Banks `$81-$99` are full and not shift-tested. Their data is reached through labels (SpriteFrames are relative to
  `SpriteFrames`), but a shift of those banks needs room: move one asset per bank to the expansion first.
- The `$D0` filler in `$9D` (where the photo tables were) only keeps `reloctest.sh retail` cycle-exact; it can go.
- Tables of offsets (`GameSfxTable`'s first 29 words, `dd Label-SpriteFrames`) are relative to their table and move with
  it, but adding an entry means updating them by hand.
