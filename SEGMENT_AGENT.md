# NHL 94 SNES segment agent

This file is the queue and the history. Do not rewrite it as a whole file. Edit it in place.
(Adapted from the NHLPA93SNES SEGMENT_AGENT.md.)
## Current rules (Oct 2026; these override older notes below)

Naming lineage is 92G -> 93G -> 94G -> 95G, and the SNES ports sit beside their Genesis parents (93S from 92G/93G, 94S from 93S plus the 94G features).
- A routine, variable or table that matches its parent takes the parent's name. 92G is the naming root.
- Clash rule: if one name would mean two different things, the earliest game's meaning keeps the name and the later one gets a new name.
- Fix the earliest repo first, then propagate the change down the lineage (92 -> 93 -> 94 -> 95, and to the SNES repos).
- Team names: 93 uses the city names of its own data; 94 and 95 use NYIslanders / NYRangers (short NYI / NYR).

Source style:
- No rename-history, provenance or origin-tag comments ("was X", "from 93G", "renamed"). That history lives in `docs/name_map.csv` only.
- No hardcoded ROM addresses in comments, and no hand-kept derived counts (sizes, numbers of entries, totals) that the code or the assembler can compute.
- Mark "new in 94" / "new in 95" only for major features, not for every changed routine.
- First-pass naming: a label with no 93S/94G (or 93G/92G) match is named from what the code clearly does when that is obvious;
  otherwise an auto label (`CODE_xxxxxx`, raw RAM address) is acceptable and is revisited in a later naming pass. Never guess a name.
- Local labels in 92 style: `.loop`, `.next`, `.done`, `.exit`, and plain numbers for trivial jumps.
- File headers are short plain-English stories of what the file does, modelled on `hockey93.asm`, `main93.asm` and `menu93.asm`.

Layout (SNES repos, 93S and 94S): `src/banks/` holds ordered bank files named by content (one `org`, then `incsrc` lines in ROM order),
`src/routines/<module>/<Routine>.asm` holds one routine per file, `src/data/<category>/` holds data. The folder is the module of the
routine's origin: 94G for 94 code, else 93G, else 92G; SNES-only code goes in a sensibly named SNES folder. Segment build stubs go in
`src/stubinc`, tools in `tools/`. The build runs a prebuild ROM check that names the path, file name, SHA-1 and size of the ROM it needs
(and extracts the assets automatically where the repo extracts them).

Work in small steps: every change is built and checked byte for byte against the reference ROM, then committed and pushed to main
(no force push; outside contributors push to their fork and open a PR, see START_HERE.md). Keep `docs/HANDOFF.md` current after each push.

## Current segment

bank87_B000. <- CURRENT

## Sources

- Reference ROM: `lst/nhl94snes.sfc` (not in the repo; `tools/prebuild.py` says where to put it, its SHA-1 and size).
- Each segment `src/bankXX_YYYY.asm` starts as an `org` plus an `incbin` of its 4 KB from `Extracted/segments/` (cut from the ROM by
  `tools/extract.py`, run automatically by the prebuild check).
- Starting text: `python3 tools/disasm65816.py lst/nhl94snes.sfc output/quickpass` writes a quick pass per segment
  (`output/quickpass/bankXX_YYYY.asm`). It decodes from the vectors by recursive descent with M/X tracking, and also decodes the
  instruction starts in `tools/codemap.txt` (from the NHL94SNESVault DiztinGUIsh export) where the bytes agree. Every instruction line
  has its address and bytes in the comment; db lines are unresolved. Labels marked `M=? X=?` come only from the codemap and
  their M/X is unknown: trace it yourself. Unreached code (after an `rtl`, behind a never-taken branch) stays db; decode it by
  rerunning the tool into a scratch dir with `--entry ADDR:M:X` (M, X = 8 or 16) once per start, e.g.
  `python3 tools/disasm65816.py lst/nhl94snes.sfc output/qp2 --entry 8085A3:16:16`. The address and byte comments are
  for checking only; strip them in `src/` (no ROM addresses in comments). `--continue` decodes past rtl/rts/rti/jmp/jml/bra/brl
  when the next bytes look like code (trial decode reaches a return or jump within 64 bytes without brk/cop/stp/wdm); it is a
  heuristic, so check its output against the data the code reads, and fall back to `--entry` where it is wrong. The quick pass of all 256 segments assembles byte for byte.
  Copy your segment's text into `src/bankXX_YYYY.asm` in place of the incbin; never point the tool at `src/`.
- Reference repos are read on GitHub (URLs in START_HERE.md; raw files at raw.githubusercontent.com); local clones are optional.
  In NHL94SNESVault, the `Src/bank_XX.asm` is the DiztinGUIsh export and `Src/all-labels.txt` its labels (most are still auto names).
- Bank $80 of 94S is a new engine: its reset, interrupt and service code does not match 93S byte for byte, so most names there
  come from what the code does. Expect 93S matches in game logic, not in the low-level services.
- Names: NHLPA93SNES (https://github.com/abdulahmad/NHLPA93SNES) for code that matches 93S, NHL94Genesis
  (https://github.com/abdulahmad/NHL94Genesis) for 94 features, then NHLPA93Genesis / NHL92Genesis down the lineage. NHL94SNESVault
  (https://github.com/Mhopkinsinc/NHL94SNESVault, public domain) for SNES-only systems and RAM it already names.
  The Vault's export does not build this exact ROM: with its patches off it differs in 344 bytes inside $D8000-$FFFFF, so check its
  code/data split there against the bytes.

## Build and verify

- `./build.sh` runs the prebuild check, assembles `src/nhl94snes.asm` with asar 1.91 into `output/nhl94snes.sfc`, and compares SHA-1 with
  `lst/nhl94snes.sfc`. It prints MATCH or MISMATCH plus the first differing offsets. The whole ROM builds in about a second.
- `sh tools/verify_segment.sh bankXX_YYYY` compares one segment's range (its org to the next segment's org) after `./build.sh`.
- `sh tools/verify_all.sh` deletes Extracted/ and output/, extracts fresh, builds, and checks every segment. Last line MATCH or FAIL.
- Never change a byte. Every session ends with `./build.sh` printing MATCH, then commit and push to main (contributors: to their fork, then a PR).

## Segment rules

- One segment per session. A segment's end may move to a routine or table boundary; move the next segment's org (and cut its incbin
  with `incbin "../Extracted/segments/<file>.bin":<start>..<end>`, decimal, end exclusive; the old `:<start>-<end>` form is
  deprecated in asar 1.91 and reads the numbers as hex) in the same commit, and note it in the row. The quick pass flags an
  instruction that crosses a segment end with "crosses into the next segment".
- Packed or binary data blocks (graphics, sound data) are data assets: add the block to the `ASSETS` list in `tools/extract.py`
  (file name with a format extension, first address, end address exclusive) so the prebuild cuts it into `Extracted/data/`, and
  include it with `incbin "../Extracted/data/<name>":<start>..<end>`. A block that spans segments is split across their files at the
  segment edges. Spell out its header fields as db/dw where they are known. Nothing in `Extracted/` is committed.
  Identify a block before naming it: `tools/snesgfx.py` unpacks all four formats (`unpack`, `blocks` lists the packed blocks
  of a ROM range) and renders tiles, maps and sprite sets to PNG (`tiles`, `map`, `sprites`; no Pillow needed).
  SpriteFrames (banks $82-$8E): `tools/spriteframes.py frames FROM TO` writes the source of the frames in a segment (tiles from
  the bank's asset SpriteFramesXX.bin; `info` lists the asset ranges), and ends the segment at a frame boundary.
- Long pointers in data: `dl Label` emits the label's own bank ($80+). Where the ROM holds a bank-$00 pointer (e.g. `$008019`),
  write `dl Label&$FFFF`; check the bytes of every `dl`/`dw` table.
- Keep operand sizes explicit (`lda.b` / `lda.w` / `lda.l`) so asar emits the same bytes. Labels are global across segments.
- RAM names go in `src/ram94snes.asm` (create it with the first name and include it at the top of `src/nhl94snes.asm`), one place each.
- Hardware register names go in `src/inc/snes_regs.asm` (copy NHLPA93SNES's).
- Name history goes in `docs/name_map.csv` (address, name, auto_name, source, note, file).
- After the segment phase the source is regrouped into the hybrid layout (`src/banks`, `src/routines/<module>`, `src/data`) as in 93S.

## ROM map

The first row that is still incbin is the current segment. Code% is the share of the segment the quick pass decoded as instructions
(false positives are possible where a `jsl` lands in data). A low or 0% Code% is not a tool fault: much of the ROM is graphics,
sound and tables, and much code is only reached through pointer tables or hooks the quick pass cannot follow. Those bytes stay db
until traced (`--entry`, `--continue`). The column is the default pass, not the segment's real code share.

| File | Status | Org | End | Code% | Note |
|---|---|---|---|---|---|
| bank80_8000 | matched 4098 bytes | $808000 | $809001 | 83% | Reset, NMI, IRQ, WaitFrame(s), WaitDMAQueue, RandomWord, JoyDirIndex, BCDTable; end moved +2 (jmp crosses) |
| bank80_9000 | matched 4083 bytes | $809002 | $809FF4 | 29% | Mul16*/Mul16x8Hi*/MulFrac*, Div16*/Div32*/DivX8*, SineTable, Sin/Cos, SPCCmd01-0E, SPCUpload/Download/Stream*, heap (HeapInit, NewHandle, DisposeHandle, HeapCompact, SetHandleSize, ...), ByteBitMasks; end moved -11 (word table) |
| bank80_A000 | matched 4108 bytes | $809FF5 | $80B000 | 79% | PitchTable, VolumeCurve, music/sound effect player (MusicStart, MusicStop, SoundInit, SoundUpdate, SetSoundFade, SoundVoicesOff), SPCIPLUpload, InitSprites, SpriteFrameStart, SpriteFrameEnd; sequencer internals keep auto labels; org moved to $809FF5, end moved +1 (lda crosses) |
| bank80_B000 | matched 4096 bytes | $80B001 | $80C000 | 89% | DrawSprite, sprite VRAM tile cache and allocators, DecompressLZ, DecompressPairs, DecompressHuffman (its jump tables as dw); allocator and decoder internals keep auto labels; org moved to $80B001, end moved +1 (cmp crosses) |
| bank80_C000 | matched 4096 bytes | $80C001 | $80D000 | 64% | Huffman long-code handlers and bit readers, DecompressRLE, Decompress (format word dispatcher), SoundDriver (SPC program as IPL blocks), shootout (ShootoutWonBy, ShootoutShooters, InitShooters, ShooterSelectList from 94G; rounds loop and screen drawing auto); org moved to $80C001, end moved +1 (jsl crosses) |
| bank80_D000 | matched 4095 bytes | $80D001 | $80DFFF | 11% | shootout player list drawing and row swap (auto labels), then data read from other banks: long pointer tables as dd, length strings as %String, rating column lists, records as db; org moved to $80D001 |
| bank80_E000 | matched 4096 bytes | $80E000 | $80EFFF | 0% | data: end of the records, copyright, CreditTitles, CreditNames, long pointer tables, $FF fill (pad) |
| bank80_F000 | matched 4096 bytes | $80F000 | $80FFFF | 0% | $FF fill (pad), OAM high table masks, internal header and vectors (93S snes_header.asm layout) |
| bank81_8000 | matched 4096 bytes | $818000 | $818FFF | 0% | start of IceRinkTiles (93S name), LZ-packed rink tiles $818000-$81ABDD, from the asset Extracted/data/IceRink.chr.lz |
| bank81_9000 | matched 4096 bytes | $819000 | $819FFF | 0% | IceRinkTiles continued (asset IceRink.chr.lz) |
| bank81_A000 | matched 4096 bytes | $81A000 | $81AFFF | 0% | end of IceRinkTiles; start of TeamLogoSprites ($81ABDE-$81FE44, Huffman-packed sprite set, asset TeamLogos.spr.huf) |
| bank81_B000 | matched 4096 bytes | $81B000 | $81BFFF | 0% | TeamLogoSprites continued (asset TeamLogos.spr.huf) |
| bank81_C000 | matched 4096 bytes | $81C000 | $81CFFF | 0% | TeamLogoSprites continued (asset TeamLogos.spr.huf) |
| bank81_D000 | matched 4096 bytes | $81D000 | $81DFFF | 0% | TeamLogoSprites continued (asset TeamLogos.spr.huf) |
| bank81_E000 | matched 4096 bytes | $81E000 | $81EFFF | 0% | TeamLogoSprites continued (asset TeamLogos.spr.huf) |
| bank81_F000 | matched 4096 bytes | $81F000 | $81FFFF | 0% | end of TeamLogoSprites; a song from TeamSongs ($81FE45, header, TRAK chunks "left"/"right") |
| bank82_8000 | matched 4235 bytes | $828000 | $82908A | 0% | SpriteFrames: frame offset table (dd), SpriteFrame0 (header and pieces as source, tiles from asset SpriteFrames82.bin); end moved +$8B (frame boundary) |
| bank82_9000 | matched 4103 bytes | $82908B | $82A091 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82908B, end moved +$92 (frame boundary) |
| bank82_A000 | matched 4024 bytes | $82A092 | $82B049 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82A092, end moved +$4A (frame boundary) |
| bank82_B000 | matched 4220 bytes | $82B04A | $82C0C5 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82B04A, end moved +$C6 (frame boundary) |
| bank82_C000 | matched 3928 bytes | $82C0C6 | $82D01D | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82C0C6, end moved +$1E (frame boundary) |
| bank82_D000 | matched 4303 bytes | $82D01E | $82E0EC | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82D01E, end moved +$ED (frame boundary) |
| bank82_E000 | matched 3933 bytes | $82E0ED | $82F049 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $82E0ED, end moved +$4A (frame boundary) |
| bank82_F000 | matched 4022 bytes | $82F04A | $82FFFF | 0% | last SpriteFrames frames of bank $82; CenterIceTilesHFD (Huffman, asset CenterIceHFD.lin.huf); $FF fill; org moved to $82F04A |
| bank83_8000 | matched 4259 bytes | $838000 | $8390A2 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$A3 (frame boundary) |
| bank83_9000 | matched 4123 bytes | $8390A3 | $83A0BD | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8390A3, end moved +$BE (frame boundary) |
| bank83_A000 | matched 4003 bytes | $83A0BE | $83B060 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $83A0BE, end moved +$61 (frame boundary) |
| bank83_B000 | matched 4316 bytes | $83B061 | $83C13C | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $83B061, end moved +$13D (frame boundary) |
| bank83_C000 | matched 4126 bytes | $83C13D | $83D15A | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $83C13D, end moved +$15B (frame boundary) |
| bank83_D000 | matched 3963 bytes | $83D15B | $83E0D5 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $83D15B, end moved +$D6 (frame boundary) |
| bank83_E000 | matched 4334 bytes | $83E0D6 | $83F1C3 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $83E0D6, end moved +$1C4 (frame boundary) |
| bank83_F000 | matched 3644 bytes | $83F1C4 | $83FFFF | 0% | last SpriteFrames frames of bank $83; CenterIceTilesPIT (Huffman, asset CenterIcePIT.lin.huf); org moved to $83F1C4 |
| bank84_8000 | matched 4316 bytes | $848000 | $8490DB | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$DC (frame boundary) |
| bank84_9000 | matched 4219 bytes | $8490DC | $84A156 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8490DC, end moved +$157 (frame boundary) |
| bank84_A000 | matched 4179 bytes | $84A157 | $84B1A9 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $84A157, end moved +$1AA (frame boundary) |
| bank84_B000 | matched 3808 bytes | $84B1AA | $84C089 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $84B1AA, end moved +$8A (frame boundary) |
| bank84_C000 | matched 4143 bytes | $84C08A | $84D0B8 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $84C08A, end moved +$B9 (frame boundary) |
| bank84_D000 | matched 4434 bytes | $84D0B9 | $84E20A | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $84D0B9, end moved +$20B (frame boundary) |
| bank84_E000 | matched 3642 bytes | $84E20B | $84F044 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $84E20B, end moved +$45 (frame boundary) |
| bank84_F000 | matched 4027 bytes | $84F045 | $84FFFF | 0% | last SpriteFrames frames of bank $84; CenterIceTilesDAL (Huffman, asset CenterIceDAL.lin.huf); org moved to $84F045 |
| bank85_8000 | matched 4265 bytes | $858000 | $8590A8 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$A9 (frame boundary) |
| bank85_9000 | matched 4214 bytes | $8590A9 | $85A11E | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8590A9, end moved +$11F (frame boundary) |
| bank85_A000 | matched 4058 bytes | $85A11F | $85B0F8 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $85A11F, end moved +$F9 (frame boundary) |
| bank85_B000 | matched 4083 bytes | $85B0F9 | $85C0EB | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $85B0F9, end moved +$EC (frame boundary) |
| bank85_C000 | matched 4125 bytes | $85C0EC | $85D108 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $85C0EC, end moved +$109 (frame boundary) |
| bank85_D000 | matched 4025 bytes | $85D109 | $85E0C1 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $85D109, end moved +$C2 (frame boundary) |
| bank85_E000 | matched 4082 bytes | $85E0C2 | $85F0B3 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $85E0C2, end moved +$B4 (frame boundary) |
| bank85_F000 | matched 3916 bytes | $85F0B4 | $85FFFF | 0% | last SpriteFrames frames of bank $85; DATA8_85FFDF (16 words and a byte, not identified); org moved to $85F0B4 |
| bank86_8000 | matched 4434 bytes | $868000 | $869151 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$152 (frame boundary) |
| bank86_9000 | matched 3884 bytes | $869152 | $86A07D | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $869152, end moved +$7E (frame boundary) |
| bank86_A000 | matched 4210 bytes | $86A07E | $86B0EF | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $86A07E, end moved +$F0 (frame boundary) |
| bank86_B000 | matched 4139 bytes | $86B0F0 | $86C11A | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $86B0F0, end moved +$11B (frame boundary) |
| bank86_C000 | matched 4249 bytes | $86C11B | $86D1B3 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $86C11B, end moved +$1B4 (frame boundary) |
| bank86_D000 | matched 3830 bytes | $86D1B4 | $86E0A9 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $86D1B4, end moved +$AA (frame boundary) |
| bank86_E000 | matched 4282 bytes | $86E0AA | $86F163 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $86E0AA, end moved +$164 (frame boundary) |
| bank86_F000 | matched 3740 bytes | $86F164 | $86FFFF | 0% | last SpriteFrames frames of bank $86; CenterIceTilesVAN (Huffman, asset CenterIceVAN.lin.huf); org moved to $86F164 |
| bank87_8000 | matched 4344 bytes | $878000 | $8790F7 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$F8 (frame boundary) |
| bank87_9000 | matched 3968 bytes | $8790F8 | $87A077 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8790F8, end moved +$78 (frame boundary) |
| bank87_A000 | matched 4075 bytes | $87A078 | $87B062 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $87A078, end moved +$63 (frame boundary) |
| bank87_B000 | incbin <- CURRENT | $87B063 | $87BFFF | 0% | org moved to $87B063 |
| bank87_C000 | incbin | $87C000 | $87CFFF | 0% | |
| bank87_D000 | incbin | $87D000 | $87DFFF | 0% | |
| bank87_E000 | incbin | $87E000 | $87EFFF | 0% | |
| bank87_F000 | incbin | $87F000 | $87FFFF | 0% | |
| bank88_8000 | incbin | $888000 | $888FFF | 0% | |
| bank88_9000 | incbin | $889000 | $889FFF | 0% | |
| bank88_A000 | incbin | $88A000 | $88AFFF | 0% | |
| bank88_B000 | incbin | $88B000 | $88BFFF | 0% | |
| bank88_C000 | incbin | $88C000 | $88CFFF | 0% | |
| bank88_D000 | incbin | $88D000 | $88DFFF | 0% | |
| bank88_E000 | incbin | $88E000 | $88EFFF | 0% | |
| bank88_F000 | incbin | $88F000 | $88FFFF | 0% | |
| bank89_8000 | incbin | $898000 | $898FFF | 0% | |
| bank89_9000 | incbin | $899000 | $899FFF | 0% | |
| bank89_A000 | incbin | $89A000 | $89AFFF | 0% | |
| bank89_B000 | incbin | $89B000 | $89BFFF | 0% | |
| bank89_C000 | incbin | $89C000 | $89CFFF | 0% | |
| bank89_D000 | incbin | $89D000 | $89DFFF | 0% | |
| bank89_E000 | incbin | $89E000 | $89EFFF | 0% | |
| bank89_F000 | incbin | $89F000 | $89FFFF | 0% | |
| bank8A_8000 | incbin | $8A8000 | $8A8FFF | 0% | |
| bank8A_9000 | incbin | $8A9000 | $8A9FFF | 0% | |
| bank8A_A000 | incbin | $8AA000 | $8AAFFF | 0% | |
| bank8A_B000 | incbin | $8AB000 | $8ABFFF | 0% | |
| bank8A_C000 | incbin | $8AC000 | $8ACFFF | 0% | |
| bank8A_D000 | incbin | $8AD000 | $8ADFFF | 0% | |
| bank8A_E000 | incbin | $8AE000 | $8AEFFF | 0% | |
| bank8A_F000 | incbin | $8AF000 | $8AFFFF | 0% | |
| bank8B_8000 | incbin | $8B8000 | $8B8FFF | 0% | |
| bank8B_9000 | incbin | $8B9000 | $8B9FFF | 0% | |
| bank8B_A000 | incbin | $8BA000 | $8BAFFF | 0% | |
| bank8B_B000 | incbin | $8BB000 | $8BBFFF | 0% | |
| bank8B_C000 | incbin | $8BC000 | $8BCFFF | 0% | |
| bank8B_D000 | incbin | $8BD000 | $8BDFFF | 0% | |
| bank8B_E000 | incbin | $8BE000 | $8BEFFF | 0% | |
| bank8B_F000 | incbin | $8BF000 | $8BFFFF | 0% | |
| bank8C_8000 | incbin | $8C8000 | $8C8FFF | 0% | |
| bank8C_9000 | incbin | $8C9000 | $8C9FFF | 0% | |
| bank8C_A000 | incbin | $8CA000 | $8CAFFF | 0% | |
| bank8C_B000 | incbin | $8CB000 | $8CBFFF | 0% | |
| bank8C_C000 | incbin | $8CC000 | $8CCFFF | 0% | |
| bank8C_D000 | incbin | $8CD000 | $8CDFFF | 0% | |
| bank8C_E000 | incbin | $8CE000 | $8CEFFF | 0% | |
| bank8C_F000 | incbin | $8CF000 | $8CFFFF | 0% | |
| bank8D_8000 | incbin | $8D8000 | $8D8FFF | 0% | |
| bank8D_9000 | incbin | $8D9000 | $8D9FFF | 0% | |
| bank8D_A000 | incbin | $8DA000 | $8DAFFF | 0% | |
| bank8D_B000 | incbin | $8DB000 | $8DBFFF | 0% | |
| bank8D_C000 | incbin | $8DC000 | $8DCFFF | 0% | |
| bank8D_D000 | incbin | $8DD000 | $8DDFFF | 0% | |
| bank8D_E000 | incbin | $8DE000 | $8DEFFF | 0% | |
| bank8D_F000 | incbin | $8DF000 | $8DFFFF | 0% | |
| bank8E_8000 | incbin | $8E8000 | $8E8FFF | 0% | |
| bank8E_9000 | incbin | $8E9000 | $8E9FFF | 0% | |
| bank8E_A000 | incbin | $8EA000 | $8EAFFF | 0% | |
| bank8E_B000 | incbin | $8EB000 | $8EBFFF | 0% | |
| bank8E_C000 | incbin | $8EC000 | $8ECFFF | 0% | |
| bank8E_D000 | incbin | $8ED000 | $8EDFFF | 0% | |
| bank8E_E000 | incbin | $8EE000 | $8EEFFF | 0% | |
| bank8E_F000 | incbin | $8EF000 | $8EFFFF | 0% | |
| bank8F_8000 | incbin | $8F8000 | $8F8FFF | 0% | |
| bank8F_9000 | incbin | $8F9000 | $8F9FFF | 0% | |
| bank8F_A000 | incbin | $8FA000 | $8FAFFF | 0% | |
| bank8F_B000 | incbin | $8FB000 | $8FBFFF | 0% | |
| bank8F_C000 | incbin | $8FC000 | $8FCFFF | 0% | |
| bank8F_D000 | incbin | $8FD000 | $8FDFFF | 0% | |
| bank8F_E000 | incbin | $8FE000 | $8FEFFF | 0% | |
| bank8F_F000 | incbin | $8FF000 | $8FFFFF | 0% | |
| bank90_8000 | incbin | $908000 | $908FFF | 0% | |
| bank90_9000 | incbin | $909000 | $909FFF | 0% | |
| bank90_A000 | incbin | $90A000 | $90AFFF | 0% | |
| bank90_B000 | incbin | $90B000 | $90BFFF | 0% | |
| bank90_C000 | incbin | $90C000 | $90CFFF | 0% | |
| bank90_D000 | incbin | $90D000 | $90DFFF | 0% | |
| bank90_E000 | incbin | $90E000 | $90EFFF | 0% | |
| bank90_F000 | incbin | $90F000 | $90FFFF | 0% | |
| bank91_8000 | incbin | $918000 | $918FFF | 0% | |
| bank91_9000 | incbin | $919000 | $919FFF | 0% | |
| bank91_A000 | incbin | $91A000 | $91AFFF | 0% | |
| bank91_B000 | incbin | $91B000 | $91BFFF | 0% | |
| bank91_C000 | incbin | $91C000 | $91CFFF | 0% | |
| bank91_D000 | incbin | $91D000 | $91DFFF | 0% | |
| bank91_E000 | incbin | $91E000 | $91EFFF | 0% | |
| bank91_F000 | incbin | $91F000 | $91FFFF | 0% | |
| bank92_8000 | incbin | $928000 | $928FFF | 0% | |
| bank92_9000 | incbin | $929000 | $929FFF | 0% | |
| bank92_A000 | incbin | $92A000 | $92AFFF | 0% | |
| bank92_B000 | incbin | $92B000 | $92BFFF | 0% | |
| bank92_C000 | incbin | $92C000 | $92CFFF | 0% | |
| bank92_D000 | incbin | $92D000 | $92DFFF | 0% | |
| bank92_E000 | incbin | $92E000 | $92EFFF | 0% | |
| bank92_F000 | incbin | $92F000 | $92FFFF | 0% | |
| bank93_8000 | incbin | $938000 | $938FFF | 0% | |
| bank93_9000 | incbin | $939000 | $939FFF | 0% | |
| bank93_A000 | incbin | $93A000 | $93AFFF | 0% | |
| bank93_B000 | incbin | $93B000 | $93BFFF | 0% | |
| bank93_C000 | incbin | $93C000 | $93CFFF | 0% | |
| bank93_D000 | incbin | $93D000 | $93DFFF | 0% | |
| bank93_E000 | incbin | $93E000 | $93EFFF | 0% | |
| bank93_F000 | incbin | $93F000 | $93FFFF | 0% | |
| bank94_8000 | incbin | $948000 | $948FFF | 0% | |
| bank94_9000 | incbin | $949000 | $949FFF | 0% | |
| bank94_A000 | incbin | $94A000 | $94AFFF | 0% | |
| bank94_B000 | incbin | $94B000 | $94BFFF | 0% | |
| bank94_C000 | incbin | $94C000 | $94CFFF | 0% | |
| bank94_D000 | incbin | $94D000 | $94DFFF | 0% | |
| bank94_E000 | incbin | $94E000 | $94EFFF | 0% | |
| bank94_F000 | incbin | $94F000 | $94FFFF | 0% | |
| bank95_8000 | incbin | $958000 | $958FFF | 0% | |
| bank95_9000 | incbin | $959000 | $959FFF | 0% | |
| bank95_A000 | incbin | $95A000 | $95AFFF | 0% | |
| bank95_B000 | incbin | $95B000 | $95BFFF | 0% | |
| bank95_C000 | incbin | $95C000 | $95CFFF | 0% | |
| bank95_D000 | incbin | $95D000 | $95DFFF | 0% | |
| bank95_E000 | incbin | $95E000 | $95EFFF | 0% | |
| bank95_F000 | incbin | $95F000 | $95FFFF | 0% | |
| bank96_8000 | incbin | $968000 | $968FFF | 0% | |
| bank96_9000 | incbin | $969000 | $969FFF | 0% | |
| bank96_A000 | incbin | $96A000 | $96AFFF | 0% | |
| bank96_B000 | incbin | $96B000 | $96BFFF | 0% | |
| bank96_C000 | incbin | $96C000 | $96CFFF | 0% | |
| bank96_D000 | incbin | $96D000 | $96DFFF | 0% | |
| bank96_E000 | incbin | $96E000 | $96EFFF | 0% | |
| bank96_F000 | incbin | $96F000 | $96FFFF | 0% | |
| bank97_8000 | incbin | $978000 | $978FFF | 0% | |
| bank97_9000 | incbin | $979000 | $979FFF | 0% | |
| bank97_A000 | incbin | $97A000 | $97AFFF | 0% | |
| bank97_B000 | incbin | $97B000 | $97BFFF | 0% | |
| bank97_C000 | incbin | $97C000 | $97CFFF | 0% | |
| bank97_D000 | incbin | $97D000 | $97DFFF | 0% | |
| bank97_E000 | incbin | $97E000 | $97EFFF | 0% | |
| bank97_F000 | incbin | $97F000 | $97FFFF | 0% | |
| bank98_8000 | incbin | $988000 | $988FFF | 0% | |
| bank98_9000 | incbin | $989000 | $989FFF | 0% | |
| bank98_A000 | incbin | $98A000 | $98AFFF | 0% | |
| bank98_B000 | incbin | $98B000 | $98BFFF | 0% | |
| bank98_C000 | incbin | $98C000 | $98CFFF | 0% | |
| bank98_D000 | incbin | $98D000 | $98DFFF | 0% | |
| bank98_E000 | incbin | $98E000 | $98EFFF | 0% | |
| bank98_F000 | incbin | $98F000 | $98FFFF | 0% | |
| bank99_8000 | incbin | $998000 | $998FFF | 0% | |
| bank99_9000 | incbin | $999000 | $999FFF | 0% | |
| bank99_A000 | incbin | $99A000 | $99AFFF | 0% | |
| bank99_B000 | incbin | $99B000 | $99BFFF | 0% | |
| bank99_C000 | incbin | $99C000 | $99CFFF | 0% | |
| bank99_D000 | incbin | $99D000 | $99DFFF | 0% | |
| bank99_E000 | incbin | $99E000 | $99EFFF | 0% | |
| bank99_F000 | incbin | $99F000 | $99FFFF | 0% | |
| bank9A_8000 | incbin | $9A8000 | $9A8FFF | 0% | |
| bank9A_9000 | incbin | $9A9000 | $9A9FFF | 0% | |
| bank9A_A000 | incbin | $9AA000 | $9AAFFF | 0% | |
| bank9A_B000 | incbin | $9AB000 | $9ABFFF | 0% | |
| bank9A_C000 | incbin | $9AC000 | $9ACFFF | 0% | |
| bank9A_D000 | incbin | $9AD000 | $9ADFFF | 0% | |
| bank9A_E000 | incbin | $9AE000 | $9AEFFF | 0% | |
| bank9A_F000 | incbin | $9AF000 | $9AFFFF | 0% | |
| bank9B_8000 | incbin | $9B8000 | $9B8FFF | 74% | |
| bank9B_9000 | incbin | $9B9000 | $9B9FFF | 37% | |
| bank9B_A000 | incbin | $9BA000 | $9BAFFF | 84% | |
| bank9B_B000 | incbin | $9BB000 | $9BBFFF | 28% | |
| bank9B_C000 | incbin | $9BC000 | $9BCFFF | 75% | |
| bank9B_D000 | incbin | $9BD000 | $9BDFFF | 0% | |
| bank9B_E000 | incbin | $9BE000 | $9BEFFF | 0% | |
| bank9B_F000 | incbin | $9BF000 | $9BFFFF | 0% | |
| bank9C_8000 | incbin | $9C8000 | $9C8FFF | 43% | |
| bank9C_9000 | incbin | $9C9000 | $9C9FFF | 76% | |
| bank9C_A000 | incbin | $9CA000 | $9CAFFF | 29% | |
| bank9C_B000 | incbin | $9CB000 | $9CBFFF | 0% | |
| bank9C_C000 | incbin | $9CC000 | $9CCFFF | 0% | |
| bank9C_D000 | incbin | $9CD000 | $9CDFFF | 0% | |
| bank9C_E000 | incbin | $9CE000 | $9CEFFF | 0% | |
| bank9C_F000 | incbin | $9CF000 | $9CFFFF | 0% | |
| bank9D_8000 | incbin | $9D8000 | $9D8FFF | 97% | |
| bank9D_9000 | incbin | $9D9000 | $9D9FFF | 85% | |
| bank9D_A000 | incbin | $9DA000 | $9DAFFF | 81% | |
| bank9D_B000 | incbin | $9DB000 | $9DBFFF | 95% | |
| bank9D_C000 | incbin | $9DC000 | $9DCFFF | 74% | |
| bank9D_D000 | incbin | $9DD000 | $9DDFFF | 42% | |
| bank9D_E000 | incbin | $9DE000 | $9DEFFF | 5% | |
| bank9D_F000 | incbin | $9DF000 | $9DFFFF | 0% | |
| bank9E_8000 | incbin | $9E8000 | $9E8FFF | 96% | |
| bank9E_9000 | incbin | $9E9000 | $9E9FFF | 97% | |
| bank9E_A000 | incbin | $9EA000 | $9EAFFF | 89% | |
| bank9E_B000 | incbin | $9EB000 | $9EBFFF | 91% | |
| bank9E_C000 | incbin | $9EC000 | $9ECFFF | 95% | |
| bank9E_D000 | incbin | $9ED000 | $9EDFFF | 79% | |
| bank9E_E000 | incbin | $9EE000 | $9EEFFF | 90% | |
| bank9E_F000 | incbin | $9EF000 | $9EFFFF | 63% | |
| bank9F_8000 | incbin | $9F8000 | $9F8FFF | 89% | |
| bank9F_9000 | incbin | $9F9000 | $9F9FFF | 81% | |
| bank9F_A000 | incbin | $9FA000 | $9FAFFF | 86% | |
| bank9F_B000 | incbin | $9FB000 | $9FBFFF | 84% | |
| bank9F_C000 | incbin | $9FC000 | $9FCFFF | 92% | |
| bank9F_D000 | incbin | $9FD000 | $9FDFFF | 82% | |
| bank9F_E000 | incbin | $9FE000 | $9FEFFF | 69% | |
| bank9F_F000 | incbin | $9FF000 | $9FFFFF | 57% | |

## History

- Setup: 256 incbin segments of 4 KB, prebuild ROM check and extractor, quick-pass tool with the Vault code map, full build MATCH.
- bank80_8000: source, MATCH. Reset/NMI/IRQ and low-level services; vector, wait, RNG and joypad helpers named from what they do (no 93S/94G byte match in this bank); hardware registers from 93S snes_regs.asm; JoyPad from the Vault. Remaining CODE_ labels are auto names. bank80_9000 org moved to $809002.
- bank80_9000: source, MATCH. Math library (16x16 and 16x8 multiplies, mode 7 fraction multiplies, 16/32-bit divides), quarter-wave SineTable with Sin/Cos, sound driver commands $01-$11 over APUIO0-3, and a handle-based heap in banks $7E/$7F; all named from what the code does (no 93S/94G byte match). Unreached routines decoded with --entry. bank80_A000 org moved to $809FF5. `jsl.l $809099` in bank80_8000 now `jsl.l Mul16U`.
- bank80_A000: source, MATCH. CPU side of the music/sound effect player (voices, tracks, envelopes, fade) with PitchTable and VolumeCurve, and SPCIPLUpload; named entry points and RAM (SoundLock, MusicOn, SoundVolume, SoundFadeSpeed) from what the code does, internals left as auto labels. Branch-skipped code decoded with --entry. bank80_B000 org moved to $80B001; bank80_8000/9000 now use the new names.
- bank80_B000: source, MATCH. Sprite system (double OAM buffers, DrawSprite, the VRAM tile cache with a 16x16 block allocator and a single tile allocator) and the WRAM decompressors called by the $80C373 dispatcher (DecompressLZ, DecompressPairs, DecompressHuffman), named from what the code does; the Vault calls DecompressHuffman LoadGameSetupScreen. OAM RAM named (OAMDrawBuf, OAMShowBuf, OAMReady, OAMNext, ...). Unreferenced entry points decoded with --entry. bank80_C000 org moved to $80C001; the sprite routines at the end of bank80_A000 are now InitSprites, SpriteFrameStart, SpriteFrameEnd.
- bank80_C000: source, MATCH. The rest of the Huffman decoder (its jump table targets now labels, CODE_80BFCD added in bank80_B000 for a branch from here), DecompressRLE and the Decompress dispatcher, SoundDriver (one IPL block to $0400, length computed by the assembler; Reset now loads #SoundDriver), and the shootout. ShootoutWonBy, ShootoutShooters, InitShooters, ShooterSelectList and the RAM homeshooters, awayshooters, shootoutround take the 94G names (same job, not the same code); the Vault calls ShooterSelectList Shootout_Edit_Lines; Selected_Goalie from the Vault. $178E/$1790 (used outside the shootout too) stay raw. bank80_D000 org moved to $80D001.
- bank80_D000: source, MATCH. The end of the shootout player list (ShooterSelectList drawing, the row swap) with auto labels, then data that other banks read, laid out by structure: long pointer tables as `dd` ($FFFFFFFF = none), length-prefixed strings with the 93S `String` macro (new `src/macros/snes94.mac`, included before the banks), the rating column lists, position and playoff round names; penalty/stoppage data and the 48-byte records (continuing into bank80_E000) as db. Table labels are the Vault auto names where it has them. bank80_C000 now calls CODE_80D004/CODE_80D2BD by label.
- bank80_E000: source, MATCH. Data only: the end of the 48-byte records, the copyright lines, the credits (CreditTitles and CreditNames, word pointer lists to zero-terminated strings, named from their content), three long pointer tables as dd, and the $FF fill as padbyte/pad. The OAM masks DrawSprite reads at $E67C are WRAM in bank $7E, not this data (HANDOFF corrected).
- bank80_F000: source, MATCH. $FF fill as padbyte/pad, the OAM high table masks at $80FF00 (same values as the WRAM copy DrawSprite reads at $7EE67C; no reader of this one found), and the internal header and vectors in the 93S snes_header.asm layout (vectors point at NMI, Reset, IRQ). Bank $80 is now all source.
- bank81_8000: source, MATCH. All of it is the start of IceRinkTiles ($818000-$81ABDD, LZ-packed, 613 tiles unpacked; bank $9F loads it to $7F0000 then VRAM $1000). Identified with the new tools/snesgfx.py: the packed map at $92E053 (48 x 113 tiles after a 6-byte header) uses exactly these tiles and renders as the rink with crowd and benches, so the 93S name IceRinkTiles applies. New: data assets. tools/extract.py has an ASSETS list and cuts Extracted/data/IceRink.chr.lz; the segment spells out the header and incbins the rest of its 4 KB from the asset. bank81_9000 and bank81_A000 continue the same asset. The format words are $FB10/$FB46/$FB30/$FB7A (little-endian; earlier notes said $10FB etc., now fixed).
- bank81_9000: source, MATCH. The next 4 KB of IceRinkTiles, an incbin of Extracted/data/IceRink.chr.lz:4096..8192.
- bank81_A000: source, MATCH. The end of IceRinkTiles, then TeamLogoSprites: a Huffman-packed sprite set ($81ABDE-$81FE44, $7C00 bytes unpacked) that the team setup code in bank $9D unpacks to $7F7800 and draws with DrawSprite, frame = team, palette per team from the long pointers at $9C8497. Rendered with the new `tools/snesgfx.py sprites`: the 26 team logos, then Wales, Campbell, NHL and NHLPA. 94G keeps separate per-team bitmaps (TeamLogoBitmaps), so the name is new. New asset TeamLogos.spr.huf in tools/extract.py.
- bank81_B000: source, MATCH. TeamLogoSprites continued, an incbin of Extracted/data/TeamLogos.spr.huf:1058..5154.
- bank81_C000: source, MATCH. TeamLogoSprites continued, an incbin of Extracted/data/TeamLogos.spr.huf:5154..9250.
- bank81_D000: source, MATCH. TeamLogoSprites continued, an incbin of Extracted/data/TeamLogos.spr.huf:9250..13346.
- bank81_E000: source, MATCH. TeamLogoSprites continued, an incbin of Extracted/data/TeamLogos.spr.huf:13346..17442.
- bank81_F000: source, MATCH. The end of TeamLogoSprites, then a song ($81FE45-$81FFFF) laid out as MusicStart reads it: header (byte 1 tempo), track offsets as label differences, then two TRAK chunks ("left", "right") of note bytes. Its pointer is in the song table of bank80_D000, which the music code at $9C9B5F indexes by home team ($1C98) * 6 + slot: named TeamSongs, with DefaultSongs (the 8-entry table it picks from at random when the team has no song for the slot). Bank $81 is now all source.
- bank82_8000: source, MATCH. SpriteFrames, the main DrawSprite sprite set (frames in the ROM halves of banks $82-$8E, used with [$10] = $828000 from banks $9B-$9F): its frame offset table as dd (raw values until the frames are source), then SpriteFrame0 with its header and pieces written out (tile offset as a label difference) and its tiles from the new asset SpriteFrames82.bin ($828F40-$82FEA8, the frames of bank $82). `tools/snesgfx.py sprites '$828000' --rom` renders the set. bank82_9000 org moved to $82908B (frame boundary).
- bank82_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82908B 82A000`. bank82_A000 org moved to $82A092 (frame boundary).
- bank82_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82A092 82B000`. bank82_B000 org moved to $82B04A (frame boundary).
- bank82_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82B04A 82C000`. bank82_C000 org moved to $82C0C6 (frame boundary).
- bank82_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82C0C6 82D000`. bank82_D000 org moved to $82D01E (frame boundary).
- bank82_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82D01E 82E000`. bank82_E000 org moved to $82E0ED (frame boundary).
- bank82_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 82E0ED 82F000`. bank82_F000 org moved to $82F04A (frame boundary).
- bank82_F000: source, MATCH. The last SpriteFrames frames of bank $82 (tools/spriteframes.py frames 82F04A 830000), then CenterIceTilesHFD ($82FEA9-$82FFF6): the Hartford centre ice logo tiles, linear 4bpp packed for DecompressHuffman, which the rink loader ($9BC17C) takes from the per-team table at $9C83B7 (tiles, map), converts with $9B85C2 and sends to VRAM after the rink tiles. Identified by rendering with its map (`tools/snesgfx.py map ... --linear`); new asset CenterIceHFD.lin.huf. Bank $82 is now all source.
- bank83_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 838000 839000`. bank83_9000 org moved to $8390A3 (frame boundary).
- bank83_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8390A3 83A000`. bank83_A000 org moved to $83A0BE (frame boundary).
- bank83_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 83A0BE 83B000`. bank83_B000 org moved to $83B061 (frame boundary).
- bank83_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 83B061 83C000`. bank83_C000 org moved to $83C13D (frame boundary).
- bank83_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 83C13D 83D000`. bank83_D000 org moved to $83D15B (frame boundary).
- bank83_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 83D15B 83E000`. bank83_E000 org moved to $83E0D6 (frame boundary).
- bank83_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 83E0D6 83F000`. bank83_F000 org moved to $83F1C4 (frame boundary).
- bank83_F000: source, MATCH. The last SpriteFrames frames of bank $83 (tools/spriteframes.py frames 83F1C4 840000), then CenterIceTilesPIT ($83FF47-$83FFFA; team 17 of the centre ice table at $9C83B7, rendered with its map $9AE168: the Penguins logo), new asset CenterIcePIT.lin.huf, and the bytes $00,$FF,$FF,$FF,$FF. Bank $83 is now all source.
- bank84_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 848000 849000`. bank84_9000 org moved to $8490DC (frame boundary).
- bank84_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8490DC 84A000`. bank84_A000 org moved to $84A157 (frame boundary).
- bank84_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 84A157 84B000`. bank84_B000 org moved to $84B1AA (frame boundary).
- bank84_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 84B1AA 84C000`. bank84_C000 org moved to $84C08A (frame boundary).
- bank84_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 84C08A 84D000`. bank84_D000 org moved to $84D0B9 (frame boundary).
- bank84_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 84D0B9 84E000`. bank84_E000 org moved to $84E20B (frame boundary).
- bank84_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 84E20B 84F000`. bank84_F000 org moved to $84F045 (frame boundary).
- bank84_F000: source, MATCH. The last SpriteFrames frames of bank $84 (tools/spriteframes.py frames 84F045 858000), then CenterIceTilesDAL ($84FF38-$84FFF8; team 5 of the centre ice table at $9C83B7, rendered with its map $9AE398: the Dallas logo), new asset CenterIceDAL.lin.huf, and the last bytes of the bank. Bank $84 is now all source.
- bank85_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 858000 859000`. bank85_9000 org moved to $8590A9 (frame boundary).
- bank85_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8590A9 85A000`. bank85_A000 org moved to $85A11F (frame boundary).
- bank85_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 85A11F 85B000`. bank85_B000 org moved to $85B0F9 (frame boundary).
- bank85_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 85B0F9 85C000`. bank85_C000 org moved to $85C0EC (frame boundary).
- bank85_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 85C0EC 85D000`. bank85_D000 org moved to $85D109 (frame boundary).
- bank85_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 85D109 85E000`. bank85_E000 org moved to $85E0C2 (frame boundary).
- bank85_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 85E0C2 85F000`. bank85_F000 org moved to $85F0B4 (frame boundary).
- bank85_F000: source, MATCH. The last SpriteFrames frames of bank $85 (tools/spriteframes.py frames 85F0B4 860000), then DATA8_85FFDF (16 words and a byte; see HANDOFF). Source comments no longer cite ROM addresses (bank82_F000 header reworded). Bank $85 is now all source.
- bank86_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 868000 869000`. bank86_9000 org moved to $869152 (frame boundary).
- bank86_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 869152 86A000`. bank86_A000 org moved to $86A07E (frame boundary).
- bank86_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 86A07E 86B000`. bank86_B000 org moved to $86B0F0 (frame boundary).
- bank86_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 86B0F0 86C000`. bank86_C000 org moved to $86C11B (frame boundary).
- bank86_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 86C11B 86D000`. bank86_D000 org moved to $86D1B4 (frame boundary).
- bank86_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 86D1B4 86E000`. bank86_E000 org moved to $86E0AA (frame boundary).
- bank86_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 86E0AA 86F000`. bank86_F000 org moved to $86F164 (frame boundary).
- bank86_F000: source, MATCH. The last SpriteFrames frames of bank $86 (tools/spriteframes.py frames 86F164 878000), then CenterIceTilesVAN ($86FE78-$86FFFA; team 23 of the centre ice table at $9C83B7, rendered with its map $9AE3DE: the Vancouver logo), new asset CenterIceVAN.lin.huf, and the last bytes of the bank. Bank $86 is now all source.
- bank87_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 878000 879000`. bank87_9000 org moved to $8790F8 (frame boundary).
- bank87_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8790F8 87A000`. bank87_A000 org moved to $87A078 (frame boundary).
- bank87_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 87A078 87B000`. bank87_B000 org moved to $87B063 (frame boundary).
