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

bank96_C000. <- CURRENT

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
| bank87_B000 | matched 4319 bytes | $87B063 | $87C141 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $87B063, end moved +$142 (frame boundary) |
| bank87_C000 | matched 4594 bytes | $87C142 | $87D333 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $87C142, end moved +$334 (frame boundary) |
| bank87_D000 | matched 3396 bytes | $87D334 | $87E077 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $87D334, end moved +$78 (frame boundary) |
| bank87_E000 | matched 4370 bytes | $87E078 | $87F189 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $87E078, end moved +$18A (frame boundary) |
| bank87_F000 | matched 3702 bytes | $87F18A | $87FFFF | 0% | last SpriteFrames frames of bank $87; DATA8_87FF91 (LZ byte map, asset DATA8_87FF91.lz); org moved to $87F18A |
| bank88_8000 | matched 4153 bytes | $888000 | $889038 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$39 (frame boundary) |
| bank88_9000 | matched 4417 bytes | $889039 | $88A179 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $889039, end moved +$17A (frame boundary) |
| bank88_A000 | matched 3903 bytes | $88A17A | $88B0B8 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $88A17A, end moved +$B9 (frame boundary) |
| bank88_B000 | matched 4067 bytes | $88B0B9 | $88C09B | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $88B0B9, end moved +$9C (frame boundary) |
| bank88_C000 | matched 3988 bytes | $88C09C | $88D02F | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $88C09C, end moved +$30 (frame boundary) |
| bank88_D000 | matched 4389 bytes | $88D030 | $88E154 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $88D030, end moved +$155 (frame boundary) |
| bank88_E000 | matched 3905 bytes | $88E155 | $88F095 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $88E155, end moved +$96 (frame boundary) |
| bank88_F000 | matched 3946 bytes | $88F096 | $88FFFF | 0% | last SpriteFrames frames of bank $88; CenterIceMapNHL (all-star centre ice logo map); org moved to $88F096 |
| bank89_8000 | matched 4218 bytes | $898000 | $899079 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$7A (frame boundary) |
| bank89_9000 | matched 4027 bytes | $89907A | $89A034 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89907A, end moved +$35 (frame boundary) |
| bank89_A000 | matched 4410 bytes | $89A035 | $89B16E | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89A035, end moved +$16F (frame boundary) |
| bank89_B000 | matched 4026 bytes | $89B16F | $89C128 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89B16F, end moved +$129 (frame boundary) |
| bank89_C000 | matched 4023 bytes | $89C129 | $89D0DF | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89C129, end moved +$E0 (frame boundary) |
| bank89_D000 | matched 3923 bytes | $89D0E0 | $89E032 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89D0E0, end moved +$33 (frame boundary) |
| bank89_E000 | matched 4492 bytes | $89E033 | $89F1BE | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $89E033, end moved +$1BF (frame boundary) |
| bank89_F000 | matched 3649 bytes | $89F1BF | $89FFFF | 0% | last SpriteFrames frames of bank $89; DATA8_89FFC7 (LZ palette, asset DATA8_89FFC7.pal.lz); $FF fill; org moved to $89F1BF |
| bank8A_8000 | matched 4258 bytes | $8A8000 | $8A90A1 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$A2 (frame boundary) |
| bank8A_9000 | matched 4087 bytes | $8A90A2 | $8AA098 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8A90A2, end moved +$99 (frame boundary) |
| bank8A_A000 | matched 4332 bytes | $8AA099 | $8AB184 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8AA099, end moved +$185 (frame boundary) |
| bank8A_B000 | matched 3945 bytes | $8AB185 | $8AC0ED | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8AB185, end moved +$EE (frame boundary) |
| bank8A_C000 | matched 4087 bytes | $8AC0EE | $8AD0E4 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8AC0EE, end moved +$E5 (frame boundary) |
| bank8A_D000 | matched 4118 bytes | $8AD0E5 | $8AE0FA | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8AD0E5, end moved +$FB (frame boundary) |
| bank8A_E000 | matched 3862 bytes | $8AE0FB | $8AF010 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8AE0FB, end moved +$11 (frame boundary) |
| bank8A_F000 | matched 4079 bytes | $8AF011 | $8AFFFF | 0% | last SpriteFrames frames of bank $8A; DATA8_8AFF7A (10 x 12 byte map); $FF fill; org moved to $8AF011 |
| bank8B_8000 | matched 4563 bytes | $8B8000 | $8B91D2 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$1D3 (frame boundary) |
| bank8B_9000 | matched 3931 bytes | $8B91D3 | $8BA12D | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8B91D3, end moved +$12E (frame boundary) |
| bank8B_A000 | matched 3813 bytes | $8BA12E | $8BB012 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8BA12E, end moved +$13 (frame boundary) |
| bank8B_B000 | matched 4355 bytes | $8BB013 | $8BC115 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8BB013, end moved +$116 (frame boundary) |
| bank8B_C000 | matched 4258 bytes | $8BC116 | $8BD1B7 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8BC116, end moved +$1B8 (frame boundary) |
| bank8B_D000 | matched 3696 bytes | $8BD1B8 | $8BE027 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8BD1B8, end moved +$28 (frame boundary) |
| bank8B_E000 | matched 4378 bytes | $8BE028 | $8BF141 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8BE028, end moved +$142 (frame boundary) |
| bank8B_F000 | matched 3774 bytes | $8BF142 | $8BFFFF | 0% | last SpriteFrames frames of bank $8B; DATA8_8BFE74 (a song from TeamSongs); $FF fill; org moved to $8BF142 |
| bank8C_8000 | matched 4413 bytes | $8C8000 | $8C913C | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$13D (frame boundary) |
| bank8C_9000 | matched 3810 bytes | $8C913D | $8CA01E | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8C913D, end moved +$1F (frame boundary) |
| bank8C_A000 | matched 4122 bytes | $8CA01F | $8CB038 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8CA01F, end moved +$39 (frame boundary) |
| bank8C_B000 | matched 4399 bytes | $8CB039 | $8CC167 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8CB039, end moved +$168 (frame boundary) |
| bank8C_C000 | matched 3983 bytes | $8CC168 | $8CD0F6 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8CC168, end moved +$F7 (frame boundary) |
| bank8C_D000 | matched 3911 bytes | $8CD0F7 | $8CE03D | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8CD0F7, end moved +$3E (frame boundary) |
| bank8C_E000 | matched 4403 bytes | $8CE03E | $8CF170 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8CE03E, end moved +$171 (frame boundary) |
| bank8C_F000 | matched 3727 bytes | $8CF171 | $8CFFFF | 0% | last SpriteFrames frames of bank $8C; DATA8_8CFDEC (a player photo, asset DATA8_8CFDEC.lin.huf); org moved to $8CF171 |
| bank8D_8000 | matched 4413 bytes | $8D8000 | $8D913C | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$13D (frame boundary) |
| bank8D_9000 | matched 4044 bytes | $8D913D | $8DA108 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8D913D, end moved +$109 (frame boundary) |
| bank8D_A000 | matched 3887 bytes | $8DA109 | $8DB037 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8DA109, end moved +$38 (frame boundary) |
| bank8D_B000 | matched 4474 bytes | $8DB038 | $8DC1B1 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8DB038, end moved +$1B2 (frame boundary) |
| bank8D_C000 | matched 4015 bytes | $8DC1B2 | $8DD160 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8DC1B2, end moved +$161 (frame boundary) |
| bank8D_D000 | matched 3769 bytes | $8DD161 | $8DE019 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8DD161, end moved +$1A (frame boundary) |
| bank8D_E000 | matched 4183 bytes | $8DE01A | $8DF070 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8DE01A, end moved +$71 (frame boundary) |
| bank8D_F000 | matched 3983 bytes | $8DF071 | $8DFFFF | 0% | last SpriteFrames frames of bank $8D; CenterIceTilesCGY (Huffman, asset CenterIceCGY.lin.huf); org moved to $8DF071 |
| bank8E_8000 | matched 4325 bytes | $8E8000 | $8E90E4 | 0% | SpriteFrames frames (tools/spriteframes.py); end moved +$E5 (frame boundary) |
| bank8E_9000 | matched 4854 bytes | $8E90E5 | $8EA3DA | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8E90E5, end moved +$3DB (frame boundary) |
| bank8E_A000 | matched 3796 bytes | $8EA3DB | $8EB2AE | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8EA3DB, end moved +$2AF (frame boundary) |
| bank8E_B000 | matched 4338 bytes | $8EB2AF | $8EC3A0 | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8EB2AF, end moved +$3A1 (frame boundary) |
| bank8E_C000 | matched 3195 bytes | $8EC3A1 | $8ED01B | 0% | SpriteFrames frames (tools/spriteframes.py); org moved to $8EC3A1, end moved +$1C (frame boundary) |
| bank8E_D000 | matched 4068 bytes | $8ED01C | $8EDFFF | 0% | last SpriteFrames frames; start of DATA8_8ED897 (sound CPU upload block, asset DATA8_8ED897.spc); org moved to $8ED01C |
| bank8E_E000 | matched 4096 bytes | $8EE000 | $8EEFFF | 0% | DATA8_8ED897 continued (asset DATA8_8ED897.spc) |
| bank8E_F000 | matched 4096 bytes | $8EF000 | $8EFFFF | 0% | end of DATA8_8ED897; DATA8_8EFD2B (a song from TeamSongs) |
| bank8F_8000 | matched 4096 bytes | $8F8000 | $8F8FFF | 0% | start of DATA8_8F8000 (sound CPU upload block, asset DATA8_8F8000.spc) |
| bank8F_9000 | matched 4096 bytes | $8F9000 | $8F9FFF | 0% | DATA8_8F8000 continued (asset DATA8_8F8000.spc) |
| bank8F_A000 | matched 4096 bytes | $8FA000 | $8FAFFF | 0% | DATA8_8F8000 continued (asset DATA8_8F8000.spc) |
| bank8F_B000 | matched 4096 bytes | $8FB000 | $8FBFFF | 0% | end of DATA8_8F8000; start of DATA8_8FBB26 (sound CPU upload block, asset DATA8_8FBB26.spc) |
| bank8F_C000 | matched 4096 bytes | $8FC000 | $8FCFFF | 0% | DATA8_8FBB26 continued (asset DATA8_8FBB26.spc) |
| bank8F_D000 | matched 4096 bytes | $8FD000 | $8FDFFF | 0% | end of DATA8_8FBB26; start of DATA8_8FDD32 (a 13-track song) |
| bank8F_E000 | matched 4096 bytes | $8FE000 | $8FEFFF | 0% | DATA8_8FDD32 continued (song) |
| bank8F_F000 | matched 4096 bytes | $8FF000 | $8FFFFF | 0% | end of DATA8_8FDD32; DATA8_8FFE74 (stand-in player photo, asset DATA8_8FFE74.lin.huf); $FF fill |
| bank90_8000 | matched 4096 bytes | $908000 | $908FFF | 0% | start of DATA8_908000 (animation tiles, asset DATA8_908000.chr) |
| bank90_9000 | matched 4096 bytes | $909000 | $909FFF | 0% | DATA8_908000 continued (asset DATA8_908000.chr) |
| bank90_A000 | matched 4096 bytes | $90A000 | $90AFFF | 0% | end of DATA8_908000; start of DATA8_90A120 (sound CPU upload block, asset DATA8_90A120.spc) |
| bank90_B000 | matched 4096 bytes | $90B000 | $90BFFF | 0% | DATA8_90A120 continued (asset DATA8_90A120.spc) |
| bank90_C000 | matched 4096 bytes | $90C000 | $90CFFF | 0% | end of DATA8_90A120; start of DATA8_90C20C (a 14-track song) |
| bank90_D000 | matched 4096 bytes | $90D000 | $90DFFF | 0% | DATA8_90C20C continued (song) |
| bank90_E000 | matched 4096 bytes | $90E000 | $90EFFF | 0% | end of DATA8_90C20C; start of DATA8_90E08C (sound CPU upload block, asset DATA8_90E08C.spc) |
| bank90_F000 | matched 4096 bytes | $90F000 | $90FFFF | 0% | end of DATA8_90E08C; DATA8_90FDE2 (a player photo, asset DATA8_90FDE2.lin.huf) |
| bank91_8000 | matched 4096 bytes | $918000 | $918FFF | 0% | start of DATA8_918000 (sound CPU upload block) |
| bank91_9000 | matched 4096 bytes | $919000 | $919FFF | 0% | end of DATA8_918000; start of DATA8_9199D2 (sound CPU upload block) |
| bank91_A000 | matched 4096 bytes | $91A000 | $91AFFF | 0% | DATA8_9199D2 continued |
| bank91_B000 | matched 4096 bytes | $91B000 | $91BFFF | 0% | end of DATA8_9199D2; start of DATA8_91B188 (Huffman-packed sprite set) |
| bank91_C000 | matched 4096 bytes | $91C000 | $91CFFF | 0% | end of DATA8_91B188; start of DATA8_91C7A7 (sound CPU upload block) |
| bank91_D000 | matched 4096 bytes | $91D000 | $91DFFF | 0% | end of DATA8_91C7A7; start of DATA8_91DDAD (LZ-packed background tiles) |
| bank91_E000 | matched 4096 bytes | $91E000 | $91EFFF | 0% | DATA8_91DDAD continued |
| bank91_F000 | matched 4096 bytes | $91F000 | $91FFFF | 0% | end of DATA8_91DDAD; DATA8_91F2F9 (sound CPU upload block) |
| bank92_8000 | matched 4096 bytes | $928000 | $928FFF | 0% | start of DATA8_928000 (sound CPU upload block) |
| bank92_9000 | matched 4096 bytes | $929000 | $929FFF | 0% | end of DATA8_928000; start of DATA8_9293F3 |
| bank92_A000 | matched 4096 bytes | $92A000 | $92AFFF | 0% | end of DATA8_9293F3; start of LetterSprites (A-Z sprite set, asset LetterSprites.spr) |
| bank92_B000 | matched 4096 bytes | $92B000 | $92BFFF | 0% | end of LetterSprites; start of DATA8_92BB61 (sound CPU upload block) |
| bank92_C000 | matched 4096 bytes | $92C000 | $92CFFF | 0% | end of DATA8_92BB61; start of DATA8_92CECD |
| bank92_D000 | matched 4096 bytes | $92D000 | $92DFFF | 0% | DATA8_92CECD continued |
| bank92_E000 | matched 4096 bytes | $92E000 | $92EFFF | 0% | end of DATA8_92CECD; start of IceRinkMap (LZ-packed rink map, 93S name, asset IceRink.map.lz) |
| bank92_F000 | matched 4096 bytes | $92F000 | $92FFFF | 0% | end of IceRinkMap; DATA8_92F18A (sound CPU upload block); DATA8_92FFB0 (6 x 6 photo map) |
| bank93_8000 | matched 4096 bytes | $938000 | $938FFF | 0% | start of DATA8_938000 (Huffman-packed background tiles) |
| bank93_9000 | matched 4096 bytes | $939000 | $939FFF | 0% | the end of DATA8_938000, then the start of DATA8_9390FA, a block for the sound CPU (upload list DATA8_80E6FD) |
| bank93_A000 | matched 4096 bytes | $93A000 | $93AFFF | 0% | the end of DATA8_9390FA, then the start of DATA8_93A18D, a block for the sound CPU (a long pointer list in bank $9C) |
| bank93_B000 | matched 4096 bytes | $93B000 | $93BFFF | 0% | the end of DATA8_93A18D, then the start of DATA8_93B217, packed linear background tiles of a screen with EA SPORTS |
| bank93_C000 | matched 4096 bytes | $93C000 | $93CFFF | 0% | the end of DATA8_93B217, then the start of DATA8_93C20B, a block for the sound CPU (upload list DATA8_80DD16) |
| bank93_D000 | matched 4096 bytes | $93D000 | $93DFFF | 0% | the end of DATA8_93C20B, then DATA8_93D187, a block for the sound CPU, then the start of DATA8_93DFAD, a block for the sound CPU (upload list DATA8_80E6FD) |
| bank93_E000 | matched 4096 bytes | $93E000 | $93EFFF | 0% | the end of DATA8_93DFAD, then the start of DATA8_93ED31, a song that MusicStart plays from several screens (laid out as in bank81_F000) |
| bank93_F000 | matched 4096 bytes | $93F000 | $93FFFF | 0% | the end of DATA8_93ED31, then DATA8_93FAB1, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD) |
| bank94_8000 | matched 4096 bytes | $948000 | $948FFF | 0% | DATA8_948000, packed tiles of logo pieces, then the start of DATA8_948D6F, a block for the sound CPU (upload list DATA8_80DD16) |
| bank94_9000 | matched 4096 bytes | $949000 | $949FFF | 0% | the end of DATA8_948D6F, then the start of DATA8_949A00, an LZ-packed block not identified yet |
| bank94_A000 | matched 4096 bytes | $94A000 | $94AFFF | 0% | the end of DATA8_949A00, then the start of DATA8_94A662, a block for the sound CPU (a long pointer list in bank $9C) |
| bank94_B000 | matched 4096 bytes | $94B000 | $94BFFF | 0% | the end of DATA8_94A662, then DATA8_94B287, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_94BEAC, a block for the sound CPU (upload list DATA8_80E6FD) |
| bank94_C000 | matched 4096 bytes | $94C000 | $94CFFF | 0% | the end of DATA8_94BEAC, then the start of DATA8_94CABF, a block for the sound CPU (upload list DATA8_80DD16) |
| bank94_D000 | matched 4096 bytes | $94D000 | $94DFFF | 0% | the end of DATA8_94CABF, then the start of DATA8_94D6A5, Huffman-packed background tiles |
| bank94_E000 | matched 4096 bytes | $94E000 | $94EFFF | 0% | the end of DATA8_94D6A5, then DATA8_94E225, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_94ED96, a block for the sound CPU (upload list DATA8_80DD16) |
| bank94_F000 | matched 4096 bytes | $94F000 | $94FFFF | 0% | the end of DATA8_94ED96, then DATA8_94F8EC, a packed sprite set of large E and A letters |
| bank95_8000 | matched 4096 bytes | $958000 | $958FFF | 0% | DATA8_958000, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_958ABD, a block for the sound CPU (upload list DATA8_80DD16) |
| bank95_9000 | matched 4096 bytes | $959000 | $959FFF | 0% | the end of DATA8_958ABD, then DATA8_959490, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_959E48, a block for the sound CPU (a long pointer list in bank $9C) |
| bank95_A000 | matched 4096 bytes | $95A000 | $95AFFF | 0% | the end of DATA8_959E48, then the start of SmallLetterSprites, a sprite set of small letters and digits |
| bank95_B000 | matched 4096 bytes | $95B000 | $95BFFF | 0% | the end of SmallLetterSprites, then DATA8_95B15C, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80DD16), then the start of DATA8_95BA96, LZ-packed tiles |
| bank95_C000 | matched 4096 bytes | $95C000 | $95CFFF | 0% | the end of DATA8_95BA96, then DATA8_95C376, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_95CBEA, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80DD16) |
| bank95_D000 | matched 4096 bytes | $95D000 | $95DFFF | 0% | the end of DATA8_95CBEA, then DATA8_95D3F2, a block for the sound CPU (upload list DATA8_80DD16), then DATA8_95DB8E, a 7 x 136 map |
| bank95_E000 | matched 4096 bytes | $95E000 | $95EFFF | 0% | DATA8_95E304, LZ-packed tiles, then the start of DATA8_95EA63, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD) |
| bank95_F000 | matched 4096 bytes | $95F000 | $95FFFF | 0% | the end of DATA8_95EA63, then DATA8_95F1AE, LZ-packed tiles, then DATA8_95F8C6, an LZ-packed block, then DATA8_95FF9B, a packed 6 x 13 map |
| bank96_8000 | matched 4096 bytes | $968000 | $968FFF | 0% | DATA8_968000, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then DATA8_968646, a song from the TeamSongs table (laid out as in bank81_F000), then the start of DATA8_968C02, an LZ-packed block |
| bank96_9000 | matched 4096 bytes | $969000 | $969FFF | 0% | the end of DATA8_968C02, then DATA8_969190, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then DATA8_9696E3, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_969C09, a song from the TeamSongs table (laid out as in bank81_F000) |
| bank96_A000 | matched 4096 bytes | $96A000 | $96AFFF | 0% | the end of DATA8_969C09, then DATA8_96A103, tiles packed for DecompressPairs, then DATA8_96A5E5, LZ-packed tiles, then DATA8_96AA64, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_96AEBB, a song from the TeamSongs table (laid out as in bank81_F000) |
| bank96_B000 | matched 4096 bytes | $96B000 | $96BFFF | 0% | the end of DATA8_96AEBB, then DATA8_96B2CF, LZ-packed tiles, then DATA8_96B6CD, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_96BABD, LZ-packed tiles, then the start of DATA8_96BEA5, a song from the TeamSongs table (laid out as in bank81_F000) |
| bank96_C000 | incbin <- CURRENT | $96C000 | $96CFFF | 0% | |
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
- bank87_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 87B063 87C000`. bank87_C000 org moved to $87C142 (frame boundary).
- bank87_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 87C142 87D000`. bank87_D000 org moved to $87D334 (frame boundary).
- bank87_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 87D334 87E000`. bank87_E000 org moved to $87E078 (frame boundary).
- bank87_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 87E078 87F000`. bank87_F000 org moved to $87F18A (frame boundary).
- bank87_F000: source, MATCH. The last SpriteFrames frames of bank $87 (tools/spriteframes.py frames 87F18A 880000), then DATA8_87FF91 ($87FF91-$87FFFA): packed for DecompressLZ, unpacked a header (10, 12, 16) and a 10 x 12 byte map, unpacked to $7F0000 by $9DB6D7; not identified, new asset DATA8_87FF91.lz. Bank $87 is now all source.
- bank88_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 888000 889000`. bank88_9000 org moved to $889039 (frame boundary).
- bank88_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 889039 88A000`. bank88_A000 org moved to $88A17A (frame boundary).
- bank88_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 88A17A 88B000`. bank88_B000 org moved to $88B0B9 (frame boundary).
- bank88_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 88B0B9 88C000`. bank88_C000 org moved to $88C09C (frame boundary).
- bank88_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 88C09C 88D000`. bank88_D000 org moved to $88D030 (frame boundary).
- bank88_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 88D030 88E000`. bank88_E000 org moved to $88E155 (frame boundary).
- bank88_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 88E155 88F000`. bank88_F000 org moved to $88F096 (frame boundary).
- bank88_F000: source, MATCH. The last SpriteFrames frames of bank $88 (tools/spriteframes.py frames 88F096 890000), then CenterIceMapNHL ($88FFC6): the centre ice logo map that teams 26 and 27 (the all-star teams) of the table at $9C83B7 use with the tiles at $9AD4B6; rendered, the NHL shield. Written as words (6 x 4 map). Bank $88 is now all source.
- bank89_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 898000 899000`. bank89_9000 org moved to $89907A (frame boundary).
- bank89_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89907A 89A000`. bank89_A000 org moved to $89A035 (frame boundary).
- bank89_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89A035 89B000`. bank89_B000 org moved to $89B16F (frame boundary).
- bank89_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89B16F 89C000`. bank89_C000 org moved to $89C129 (frame boundary).
- bank89_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89C129 89D000`. bank89_D000 org moved to $89D0E0 (frame boundary).
- bank89_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89D0E0 89E000`. bank89_E000 org moved to $89E033 (frame boundary).
- bank89_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 89E033 89F000`. bank89_F000 org moved to $89F1BF (frame boundary).
- bank89_F000: source, MATCH. The last SpriteFrames frames of bank $89 (tools/spriteframes.py frames 89F1BF 8A0000), then DATA8_89FFC7 ($89FFC7-$89FFF3): an LZ-packed palette that $9DC8E4 unpacks and loads with $9DE0BD (Y = first colour $40, X = 16 colours); the screen is not identified. New asset DATA8_89FFC7.pal.lz. Bank $89 is now all source.
- bank8A_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8A8000 8A9000`. bank8A_9000 org moved to $8A90A2 (frame boundary).
- bank8A_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8A90A2 8AA000`. bank8A_A000 org moved to $8AA099 (frame boundary).
- bank8A_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8AA099 8AB000`. bank8A_B000 org moved to $8AB185 (frame boundary).
- bank8A_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8AB185 8AC000`. bank8A_C000 org moved to $8AC0EE (frame boundary).
- bank8A_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8AC0EE 8AD000`. bank8A_D000 org moved to $8AD0E5 (frame boundary).
- bank8A_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8AD0E5 8AE000`. bank8A_E000 org moved to $8AE0FB (frame boundary).
- bank8A_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8AE0FB 8AF000`. bank8A_F000 org moved to $8AF011 (frame boundary).
- bank8A_F000: source, MATCH. The last SpriteFrames frames of bank $8A (tools/spriteframes.py frames 8AF011 8B0000), then DATA8_8AFF7A: three words (10, 12, 16) and a 10 x 12 byte map, not packed, read at $9DB635 (the same layout as DATA8_87FF91 once unpacked); not identified. Bank $8A is now all source.
- bank8B_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8B8000 8B9000`. bank8B_9000 org moved to $8B91D3 (frame boundary).
- bank8B_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8B91D3 8BA000`. bank8B_A000 org moved to $8BA12E (frame boundary).
- bank8B_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8BA12E 8BB000`. bank8B_B000 org moved to $8BB013 (frame boundary).
- bank8B_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8BB013 8BC000`. bank8B_C000 org moved to $8BC116 (frame boundary).
- bank8B_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8BC116 8BD000`. bank8B_D000 org moved to $8BD1B8 (frame boundary).
- bank8B_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8BD1B8 8BE000`. bank8B_E000 org moved to $8BE028 (frame boundary).
- bank8B_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8BE028 8BF000`. bank8B_F000 org moved to $8BF142 (frame boundary).
- bank8B_F000: source, MATCH. The last SpriteFrames frames of bank $8B (tools/spriteframes.py frames 8BF142 8C0000), then DATA8_8BFE74: a song laid out as in bank81_F000 (TeamSongs entries 31, 32 and 79 point to it: Dallas slots 1 and 2, NY Islanders slot 1), then $FF fill. Bank $8B is now all source.
- bank8C_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8C8000 8C9000`. bank8C_9000 org moved to $8C913D (frame boundary).
- bank8C_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8C913D 8CA000`. bank8C_A000 org moved to $8CA01F (frame boundary).
- bank8C_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8CA01F 8CB000`. bank8C_B000 org moved to $8CB039 (frame boundary).
- bank8C_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8CB039 8CC000`. bank8C_C000 org moved to $8CC168 (frame boundary).
- bank8C_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8CC168 8CD000`. bank8C_D000 org moved to $8CD0F7 (frame boundary).
- bank8C_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8CD0F7 8CE000`. bank8C_E000 org moved to $8CE03E (frame boundary).
- bank8C_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8CE03E 8CF000`. bank8C_F000 org moved to $8CF171 (frame boundary).
- bank8C_F000: source, MATCH. The last SpriteFrames frames of bank $8C (tools/spriteframes.py frames 8CF171 8D0000), then DATA8_8CFDEC ($8CFDEC-$8CFFFF): entry 390 (team 15, column 0) of the photo table at $9DCD53, Huffman-packed linear 4bpp 6 x 6 tiles that render as a player photo. New asset DATA8_8CFDEC.lin.huf. Bank $8C is now all source.
- bank8D_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8D8000 8D9000`. bank8D_9000 org moved to $8D913D (frame boundary).
- bank8D_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8D913D 8DA000`. bank8D_A000 org moved to $8DA109 (frame boundary).
- bank8D_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8DA109 8DB000`. bank8D_B000 org moved to $8DB038 (frame boundary).
- bank8D_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8DB038 8DC000`. bank8D_C000 org moved to $8DC1B2 (frame boundary).
- bank8D_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8DC1B2 8DD000`. bank8D_D000 org moved to $8DD161 (frame boundary).
- bank8D_D000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8DD161 8DE000`. bank8D_E000 org moved to $8DE01A (frame boundary).
- bank8D_E000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8DE01A 8DF000`. bank8D_F000 org moved to $8DF071 (frame boundary).
- bank8D_F000: source, MATCH. The last SpriteFrames frames of bank $8D (tools/spriteframes.py frames 8DF071 8E8000), then CenterIceTilesCGY ($8DFF3D-$8DFFFB; team 3 of the centre ice table at $9C83B7, rendered with its map $9AE6E0: the Calgary logo), new asset CenterIceCGY.lin.huf, and the last bytes of the bank. Bank $8D is now all source.
- bank8E_8000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8E8000 8E9000`. bank8E_9000 org moved to $8E90E5 (frame boundary).
- bank8E_9000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8E90E5 8EA000`. bank8E_A000 org moved to $8EA3DB (frame boundary).
- bank8E_A000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8EA3DB 8EB000`. bank8E_B000 org moved to $8EB2AF (frame boundary).
- bank8E_B000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8EB2AF 8EC000`. bank8E_C000 org moved to $8EC3A1 (frame boundary).
- bank8E_C000: source, MATCH. SpriteFrames continued, written by `tools/spriteframes.py frames 8EC3A1 8ED000`. bank8E_D000 org moved to $8ED01C (frame boundary).
- bank8E_D000: source, MATCH. The last SpriteFrames frames (frame 975 ends at $8ED897; SpriteFrames is now all source), then the start of DATA8_8ED897: a block for SPCUploadBlock (sound RAM $1545, $2490 bytes; in the upload lists DATA8_80E6C1 and DATA8_80E6FD that $9C9860 and $9C97B0 send at sound setup), new asset DATA8_8ED897.spc, split at the segment edges.
- bank8E_E000: source, MATCH. DATA8_8ED897 continued, an incbin of Extracted/data/DATA8_8ED897.spc:1897..5993.
- bank8E_F000: source, MATCH. The end of DATA8_8ED897, then DATA8_8EFD2B: a song (TeamSongs entries 114 and 139: San Jose slot 0, Vancouver slot 1) laid out as in bank81_F000; its chunk sizes are big-endian words ($0166, $0146). Bank $8E is now all source.
- bank8F_8000: source, MATCH. The start of DATA8_8F8000 ($8F8000-$8FBB25): the block of the upload list DATA8_80E73D, for SPCUploadBlock ($3B22 bytes). New asset DATA8_8F8000.spc. Bank $8F then holds a second block (DATA8_8FBB26, $8FBB26-$8FDD31), a 13-track song (DATA8_8FDD32, $8FDD32-$8FFE73) and a stand-in player photo (DATA8_8FFE74).
- bank8F_9000: source, MATCH. DATA8_8F8000 continued, an incbin of Extracted/data/DATA8_8F8000.spc:4096..8192.
- bank8F_A000: source, MATCH. DATA8_8F8000 continued, an incbin of Extracted/data/DATA8_8F8000.spc:8192..12288.
- bank8F_B000: source, MATCH. The end of DATA8_8F8000, then the start of DATA8_8FBB26 ($8FBB26-$8FDD31): a block for SPCUploadBlock ($2208 bytes) that a long pointer list near $9C9A5B names. New asset DATA8_8FBB26.spc.
- bank8F_C000: source, MATCH. DATA8_8FBB26 continued, an incbin of Extracted/data/DATA8_8FBB26.spc:1242..5338.
- bank8F_D000: source, MATCH. The end of DATA8_8FBB26, then the start of DATA8_8FDD32 ($8FDD32-$8FFE73): a song with 13 named tracks (timp, orch, BASS #2, ...) laid out as the other songs; track labels are made label-safe from the names. Offsets of tracks not yet in source are written as numbers; bank8F_F000 turns them into label differences.
- bank8F_E000: source, MATCH. The song DATA8_8FDD32 continued.
- bank8F_F000: source, MATCH. The end of the song DATA8_8FDD32 (its track offsets in bank8F_D000 are now all label differences), then DATA8_8FFE74 ($8FFE74-$8FFFEE): the player photo that most photo-table entries without their own photo share, a generic skater; new asset DATA8_8FFE74.lin.huf; $FF fill. Bank $8F is now all source.
- bank90_8000: source, MATCH. The start of DATA8_908000 ($908000-$90A11F): SNES 4bpp tiles, not packed, that the play code at $9BA0A2 copies to VRAM as animation frames; the first ones render as crowd graphics. New asset DATA8_908000.chr (.chr = planar tiles, not packed). Bank $90 then holds DATA8_90A120 (upload block, list near $9C9A5B), the song DATA8_90C20C (played by MusicStart from $9BB0B6, $9F82FB, $9F8CFD, $9F9125), DATA8_90E08C (upload block, DATA8_80E6C1 entry 12) and a player photo DATA8_90FDE2 (photo table entry 159).
- bank90_9000: source, MATCH. DATA8_908000 continued, an incbin of Extracted/data/DATA8_908000.chr:4096..8192.
- bank90_A000: source, MATCH. The end of DATA8_908000, then the start of DATA8_90A120 ($90A120-$90C20B): a block for SPCUploadBlock ($20E8 bytes), entry 3 of the long pointer list near $9C9A5B. New asset DATA8_90A120.spc.
- bank90_B000: source, MATCH. DATA8_90A120 continued, an incbin of Extracted/data/DATA8_90A120.spc:3808..7904.
- bank90_C000: source, MATCH. The end of DATA8_90A120, then the start of DATA8_90C20C ($90C20C-$90E08B): a song with 14 named tracks that MusicStart plays from $9BB0B6, $9F82FB, $9F8CFD and $9F9125, laid out as the other songs. Offsets of tracks not yet in source are numbers until bank90_E000.
- bank90_D000: source, MATCH. The song DATA8_90C20C continued.
- bank90_E000: source, MATCH. The end of the song DATA8_90C20C (its track offsets in bank90_C000 are now all label differences), then the start of DATA8_90E08C ($90E08C-$90FDE1): a block for SPCUploadBlock ($1D52 bytes), entry 12 of the upload list DATA8_80E6C1. New asset DATA8_90E08C.spc.
- bank90_F000: source, MATCH. The end of DATA8_90E08C, then DATA8_90FDE2 ($90FDE2-$90FFFE): a player photo, entry 159 of the photo table (team 6, column 3); new asset DATA8_90FDE2.lin.huf; then the last byte of the bank. Bank $90 is now all source.
- bank91_8000: source, MATCH. The start of DATA8_918000 ($918000-$9199D1, upload lists DATA8_80E6C1/E6FD entry 7). Bank $91: DATA8_9199D2 (upload, entry 10), DATA8_91B188 (a Huffman-packed sprite set of an opening screen: N, H, L letters, NHL shield, NHLPA logo, licence line), DATA8_91C7A7 (upload, DATA8_80DD16 entry 17; DATA8_80DD16 is a list of 20 upload blocks), DATA8_91DDAD (LZ-packed background tiles with EA SPORTS / ELECTRONIC ARTS), DATA8_91F2F9 (upload, DATA8_80DD16 entry 0). Assets per block.
- bank91_9000: source, MATCH. The end of DATA8_918000, then the start of DATA8_9199D2 ($9199D2-$91B187, upload lists entry 10).
- bank91_A000: source, MATCH. DATA8_9199D2 continued.
- bank91_B000: source, MATCH. The end of DATA8_9199D2, then the start of DATA8_91B188 ($91B188-$91C7A5): a sprite set packed for DecompressHuffman that the screen setup at $9DB716 unpacks to $7F5000; rendered (`tools/snesgfx.py sprites '$91B188'`): the N, H and L letters in three steps each, the NHL shield, the NHLPA logo and the licence line. New asset DATA8_91B188.spr.huf.
- bank91_C000: source, MATCH. The end of DATA8_91B188, a zero byte, then the start of DATA8_91C7A7 ($91C7A7-$91DDAC): a block for SPCUploadBlock, entry 17 of the upload list DATA8_80DD16. New asset DATA8_91C7A7.spc.
- bank91_D000: source, MATCH. The end of DATA8_91C7A7, then the start of DATA8_91DDAD ($91DDAD-$91F2F8): background tiles packed for DecompressLZ that the screen setup at $9DC7E6 unpacks and sends to VRAM; rendered they show EA SPORTS and ELECTRONIC ARTS. New asset DATA8_91DDAD.chr.lz.
- bank91_E000: source, MATCH. DATA8_91DDAD continued.
- bank91_F000: source, MATCH. The end of DATA8_91DDAD, then DATA8_91F2F9 ($91F2F9-$91FFFE): a block for SPCUploadBlock, entry 0 of the upload list DATA8_80DD16; new asset DATA8_91F2F9.spc; then the last byte. Bank $91 is now all source.
- bank92_8000: source, MATCH. The start of DATA8_928000 ($928000-$9293F2, DATA8_80DD16 entry 11). Bank $92: DATA8_9293F3 (upload, DD16 entry 3), LetterSprites ($92A7B9-$92BB60, the letters A-Z as an unpacked sprite set that the text routine at $9C93C3 draws with; rendered), DATA8_92BB61 (upload, E6C1/E6FD entry 2), DATA8_92CECD (upload, list near $9C9A5B entry 1), IceRinkMap ($92E053-$92F189, the LZ-packed rink map; 93S name), DATA8_92F18A (upload, E6C1/E6FD entry 6), DATA8_92FFB0 (a 6 x 6 photo map read near $9DCA25).
- bank92_9000: source, MATCH. The end of DATA8_928000, then the start of DATA8_9293F3 ($9293F3-$92A7B8, DATA8_80DD16 entry 3).
- bank92_A000: source, MATCH. The end of DATA8_9293F3, then the start of LetterSprites ($92A7B9-$92BB60): the letters A to Z as a DrawSprite sprite set, not packed; the text routine at $9C93C3 maps a character to a frame and draws it, advancing by a width table. New asset LetterSprites.spr.
- bank92_B000: source, MATCH. The end of LetterSprites (name_map row added), then the start of DATA8_92BB61 ($92BB61-$92CECC, upload lists E6C1/E6FD entry 2).
- bank92_C000: source, MATCH. The end of DATA8_92BB61, then the start of DATA8_92CECD ($92CECD-$92E052, entry 1 of the upload list near $9C9A5B).
- bank92_D000: source, MATCH. DATA8_92CECD continued (IceRinkMap starts in bank92_E000).
- bank92_E000: source, MATCH. The end of DATA8_92CECD, then the start of IceRinkMap ($92E053-$92F189): the rink map packed for DecompressLZ (a header of three words, 48 x 113 map words for IceRinkTiles), which $9BC1D5 unpacks before it pastes the centre ice logo; the 93S name; new asset IceRink.map.lz.
- bank92_F000: source, MATCH. The end of IceRinkMap, then DATA8_92F18A ($92F18A-$92FFAF, upload lists E6C1/E6FD entry 6), DATA8_92FFB0 (a map for a player photo: 6, 6, $0308, then tile numbers 0-35 in order; read near $9DCA25), and $FF,$FF. Bank $92 is now all source.
- bank93_8000: source, MATCH. The start of DATA8_938000 ($938000-$9390F9): background tiles packed for DecompressHuffman, unpacked near $9DDC1F; the screen is not identified. Bank $93: DATA8_9390FA (upload, E6FD entry 15), DATA8_93A18D (upload, list near $9C9A5B entry 5), DATA8_93B217 (linear tiles packed for DecompressPairs, a screen with EA SPORTS; read near $9DC7A3), DATA8_93C20B (upload, DD16 entry 8), DATA8_93D187 (upload, in no list found yet), DATA8_93DFAD (upload, E6FD entry 13), DATA8_93ED31 (a 14-track song, MusicStart from $9BB0A5, $9D8C04, $9F8CEC, $9F9115), DATA8_93FAB1 (upload, E6C1/E6FD entry 0).
- bank93_9000: source, MATCH. The end of DATA8_938000, then the start of DATA8_9390FA, a block for the sound CPU (upload list DATA8_80E6FD).
- bank93_A000: source, MATCH. The end of DATA8_9390FA, then the start of DATA8_93A18D, a block for the sound CPU (a long pointer list in bank $9C).
- bank93_B000: source, MATCH. The end of DATA8_93A18D, then the start of DATA8_93B217, packed linear background tiles of a screen with EA SPORTS.
- bank93_C000: source, MATCH. The end of DATA8_93B217, then the start of DATA8_93C20B, a block for the sound CPU (upload list DATA8_80DD16).
- bank93_D000: source, MATCH. The end of DATA8_93C20B, then DATA8_93D187, a block for the sound CPU, then the start of DATA8_93DFAD, a block for the sound CPU (upload list DATA8_80E6FD).
- bank93_E000: source, MATCH. The end of DATA8_93DFAD, then the start of DATA8_93ED31, a song that MusicStart plays from several screens (laid out as in bank81_F000).
- bank93_F000: source, MATCH. The end of DATA8_93ED31, then DATA8_93FAB1, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD). Bank $93 is now all source.
- bank94_8000: source, MATCH. DATA8_948000, packed tiles of logo pieces, then the start of DATA8_948D6F, a block for the sound CPU (upload list DATA8_80DD16).
- bank94_9000: source, MATCH. The end of DATA8_948D6F, then the start of DATA8_949A00, an LZ-packed block not identified yet.
- bank94_A000: source, MATCH. The end of DATA8_949A00, then the start of DATA8_94A662, a block for the sound CPU (a long pointer list in bank $9C).
- bank94_B000: source, MATCH. The end of DATA8_94A662, then DATA8_94B287, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_94BEAC, a block for the sound CPU (upload list DATA8_80E6FD).
- bank94_C000: source, MATCH. The end of DATA8_94BEAC, then the start of DATA8_94CABF, a block for the sound CPU (upload list DATA8_80DD16).
- bank94_D000: source, MATCH. The end of DATA8_94CABF, then the start of DATA8_94D6A5, Huffman-packed background tiles.
- bank94_E000: source, MATCH. The end of DATA8_94D6A5, then DATA8_94E225, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_94ED96, a block for the sound CPU (upload list DATA8_80DD16).
- bank94_F000: source, MATCH. The end of DATA8_94ED96, then DATA8_94F8EC, a packed sprite set of large E and A letters. Bank $94 is now all source.
- bank95_8000: source, MATCH. DATA8_958000, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_958ABD, a block for the sound CPU (upload list DATA8_80DD16).
- bank95_9000: source, MATCH. The end of DATA8_958ABD, then DATA8_959490, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_959E48, a block for the sound CPU (a long pointer list in bank $9C).
- bank95_A000: source, MATCH. The end of DATA8_959E48, then the start of SmallLetterSprites, a sprite set of small letters and digits.
- bank95_B000: source, MATCH. The end of SmallLetterSprites, then DATA8_95B15C, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80DD16), then the start of DATA8_95BA96, LZ-packed tiles.
- bank95_C000: source, MATCH. The end of DATA8_95BA96, then DATA8_95C376, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_95CBEA, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80DD16).
- bank95_D000: source, MATCH. The end of DATA8_95CBEA, then DATA8_95D3F2, a block for the sound CPU (upload list DATA8_80DD16), then DATA8_95DB8E, a 7 x 136 map.
- bank95_E000: source, MATCH. DATA8_95E304, LZ-packed tiles, then the start of DATA8_95EA63, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD).
- bank95_F000: source, MATCH. The end of DATA8_95EA63, then DATA8_95F1AE, LZ-packed tiles, then DATA8_95F8C6, an LZ-packed block, then DATA8_95FF9B, a packed 6 x 13 map. Bank $95 is now all source.
- bank96_8000: source, MATCH. DATA8_968000, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then DATA8_968646, a song from the TeamSongs table (laid out as in bank81_F000), then the start of DATA8_968C02, an LZ-packed block.
- bank96_9000: source, MATCH. The end of DATA8_968C02, then DATA8_969190, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then DATA8_9696E3, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the start of DATA8_969C09, a song from the TeamSongs table (laid out as in bank81_F000).
- bank96_A000: source, MATCH. The end of DATA8_969C09, then DATA8_96A103, tiles packed for DecompressPairs, then DATA8_96A5E5, LZ-packed tiles, then DATA8_96AA64, a block for the sound CPU (upload list DATA8_80DD16), then the start of DATA8_96AEBB, a song from the TeamSongs table (laid out as in bank81_F000).
- bank96_B000: source, MATCH. The end of DATA8_96AEBB, then DATA8_96B2CF, LZ-packed tiles, then DATA8_96B6CD, a song from the TeamSongs table (laid out as in bank81_F000), then DATA8_96BABD, LZ-packed tiles, then the start of DATA8_96BEA5, a song from the TeamSongs table (laid out as in bank81_F000).
