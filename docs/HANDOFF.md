# Handoff

## Naming pass

- `docs/cleanup_plan.md` is the audit: 6881 generic labels (5100 `CODE_`, 976 `SpriteFrameN`, 793 `DATA8_`, 12 `DATA16_`) and the asset inventory.
- stats, video and middle: branch targets inside the already-named routines now use the 93S local names. `appstring`'s tail (`CODE_9ECFC1`) is the `.done` of that routine and lives in the same file. Direct-page registers `a0`–`a3`, `d0`–`d2`, `tmp0`–`tmp2`, plus `Hpos`, `Vpos`, `printm`, `textdirtylo`, `textdirtyhi`, `textmap`, `printfontset`, `RemapOut` and `Playerdata`, are in `src/ram94snes.asm`. Those files use them. Known RAM and PPU operands in the instruction stream now use the equates in `src/ram94snes.asm` and `src/inc/snes_regs.asm`. Addresses that are still raw are on the Unsure list, or they are immediates that are not a proven flag.
- logic: the same pass. `assreplace` is the 93S name (callers updated). `vtoa` holds `.nodir` and `.dt`. `getlchoice` holds `.tab`. `ShotMode` holds `.off` and `.rts`. New equates: `d7`, `SPAcnt`, `facedir`, `assnum`, `asslist`, `puckobj`, `puckx`, `ScoreOdds`, `gmoffs`, `gmhl`, `pfna`, `tmfoffside`, `cbut`, `blueline`, `PenOffsides` ($12 in this ROM).
- Assets: the 302 binaries are no longer committed. `tools/prebuild.py` extracts them into `Extracted/data/` and writes `Extracted/.extract-complete.json` last. Asm `incbin`s those files. Packed streams stay packed. `SpriteFramesXX.bin` is still one ROM cut per bank (headers in source, tiles by range), not one `.chr` per frame.
- penalty, hockey and shootout: local labels inside the named routines now use the 93S names (shootout copy loops use the 94G names). `ResetBench` holds the tail that was `CODE_9FCDFA`. `updatepwrplay` holds its print tail. `SetPA2` is the referee step `UpdatePA` calls. New equates in `src/ram94snes.asm`: `gmclock`, `PenBuf`, `RefPen`, `xsave`, `a4`, `d3`–`d6`, `PenIcing`, `PenGoal`, `gmpen`, `sfwrap`, `sf2drec`, `sf2pwrplay`, `sf2pwrtm`, `pf2inj`, the `TMPD*` roster states, `PWrange`, `pwlength`, `replaysize`, `Oldrow`, `vramrow`, `pfalock`, `PerTimeTotal`, `tmteam`, `TempPlOffset`, `OptPen`, `PassWord`, `passbits`, `PlList`, `ReplayBufferStart`, `ReplayBufferEnd`, `priolist`, `PerLabels`, and the scouting-report scroll words.
- `routines/snes`, banks `$9E`, `$9F`, `$9B`, `$9D`, `$9C` and `$80`: each `CODE_` entry was compared with the 93S routines. A name was applied only when the opening instructions and the small immediates matched one 93S routine, or when the body and the callers were the same routine (password bits, the ticker, `chkpk`). Those files moved to the 93S folder. The rest did not match one routine and stay `CODE_`. New equates from that pass: `xc1`, `yc1`, `sf2replay`, `sfslock`, `mesarea` (`$0A2A`; `$0A2C` is `mesarea+2`).
- `data/text`, `data/tables`, `data/sound` and `data/gfx`: `DATA8_` blocks were compared with the 93S tables. The ones that match already have those names (the nine text tables, team data). The remaining blocks are mixed banks and stay `DATA8_`.
- SPA names in `src/data/frames94s.asm` stay off. The list has the 94G shape, and the frame numbers are not the 94G SPF values.
- Named routine files have a one-line header. `CODE_` files still say they are unidentified. That is the placeholder.
- Branch targets that were only used inside one routine are 92-style locals (`.loop`, `.rtl`, `.1`). 1108 `CODE_` files that were only the next bytes of the previous routine were folded into that routine.
- Shared routines whose body is one 93S routine: `randomd0sd0`, `DecodePW`, `marktextlo`, `marktexthi`, `CheckInjury`, `ShowInjuryBox`, `PlayerShortName`, `showref`, `nullrtl89`, `printscores1` (its horizontal half is `.sbscreen`), `EASNLogo`, `USBoard` and `DispPen`. The file that used to be called `ShowInjuryBox` is `USBoard` (the penalty-box lines on the scoreboard). `ShowInjuryBox` is the 12 by 5 injury box. `SetSPAFromA` is `SetSPA` with the animation already in A. New equates: `InjCntDown` (`$1626`), `gmdir`, `sf2refref`, `sf3llcs`. Text tables named from their strings: `PauseMenuItems`, `GoalieOptionText`, `GameSetupChoices`, `GameSetupNames`, `PlayoffSetupNames`, `LineSlotNames`, `RosterGroups`, `RatingNames`, the exit prompt lines, `StatColumnNames`, `TeamStatNames`, `TeamStatNamesNoPen`, `LineBraces`, `PercentSign`, `LineMenuNames`, `BestLineNames`, `CopyrightLines`, `ScoutFragments`, `LongNYIslanders`, `LongNYRangers`, and the MultiPlayer 5 warnings. Screen routines named from the title they draw: `ShowCrowdMeter`, `ShowOtherScores`, `PasswordScreen`, `BadPasswordPrompt`, `ShowGameStats`, `ShowMatchups`, `EditLinesMenu`, `ShowStars`. Pause menu handlers are named from the item they run: `PauseResume`, `PauseReplay`, `PauseGameStats`, `PauseTeamRoster`, `PauseEditLines`, `PausePlayerStats`, `PauseScoringSummary`, `PausePenaltySummary`, `PausePeriodStats`, `PauseGoalie`, `PauseGoalieMode`, `PauseDefControl`, `PausePlayerCards`, `PauseOtherScores`, `PauseCrowdLevel`, `PauseExitGame`, `PauseTimeout`, and `PauseShootoutSetup`. `AskExitGame` is the yes or no prompt. The screens those handlers open: `ShowScoringSummary`, `ShowPenaltySummary`, `ShowPeriodStats`, `DrawPeriodStats`, `ShowPlayerStats`, `ShowPlayerCards`, `DrawPlayerCard`, `PrintTeamStatRows`, `EditLinesScreen`, `DrawExitPrompt`, `PauseMenu` (93S), `PauseMenuPoll`, `TeamRoster` (93S), `SwapRosterTeam`, `DrawPenaltyPage`, `PrintScrollHint`, `PrintLineNames`, `SwapPlayerStatsTeam`, `PrintCopyright`, and `ShowMP5Warning`. Page scroll and card changes for those screens: `ScrollScoringUp`, `ScrollScoringDown`, `DrawScoringPage`, `ScrollPenaltyUp`, `ScrollPenaltyDown`, `NextPlayerCard`, `PrevPlayerCard`, `SwapPlayerCardTeam`, `DrawOtherScoresPage`, `PrintMP5Line1` through `PrintMP5Line4`, and `PrintCentered`. Pause input around that menu: `SelectPauseController`, `ChoosePauseMenu`, `WaitButtonRelease`, `PrintSelectLeft`, `PlacePasswordCursor`, and `MoveRosterColumn`. `CODE_` labels left: 1849, in 982 files. Screen titles in the mixed text banks (`ReturnToGame`, `CrowdMeter`, `ScoringSummaryHead`, `StarsOfTheGame`, and the other phrases in that bank) are named. `ShooterAttribColumns` and `SkaterAttribColumns` are the bracketed rating lists. `DATA8_` labels left: 705.

## Unsure

- `$0A48` in PushNumber and PushTime is the end of the decimal string those routines build. The buffer base is `mesarea` (`$0A2A`). `$0A48` is not its own equate.
- `$00`, `$04` and `$08` are the divider's scratch (`Div16x8U`: `$08 / $04` into `$00`). They are also the math scratch in the engine, so they stay raw.
- `$C3` in `vtoa` holds the direction bits. 93S reuses `d0+2` for that. Here `d0` is only a word, so `$C3` stays raw.
- `$0B7D` in `assreplace` is stored with the assignment and has no 93S counterpart.
- `$0AD9` is the player index `ShotMode` compares with X. Not named.
- `CODE_9EE220` is the shot release `ShotMode` jumps to. It is not a clean match for 93S `doshot`, so the name stays. `$14E3` is `pfalock` from the `setplayer` pair with `SPA`.
- `CODE_9FD85F` is the code that used to sit after the line-choice table. It compares the word at `$1003` with 100. Not named.
- `$163A` is tested by `AddPenalty` and is not `OptPen` (`OptPen` is `$7E34C4`, and zero means penalties are off).
- `$7E34C6` in `SetupTeamForIntermission` picks the power-play line when it is nonzero. 93S `OptLine` branches the other way, so this address stays raw.
- `$0024` in `AddPenalty` is a second penalty number that always counts, beside `PenIcing`.
- `#$000B` and `#$000A` in `setplayer` are the from-box and from-bench assignments. 93S `aepen`/`aeben` are `$0A`/`$09`, so these stay raw.
- `#$0012` in `forcepldata` is the center's assignment. 93S `anearest` is `$11`.
- `$FFFC` is compared next to `TMPDOUT` in `reenergizeteam`, `TryAddPlayerToList` and `ResetBench`. It is not a 93S roster state.
- `$1742` is the base `ClearTeamStats` clears. The span is shorter than 93S `tmshots`, so the name stays off.
- `$7E35D4` is the playoff-round index `GetShifter` reads. Not named.
- `$0CE5` is a bonus `setplayer` clears beside `HmAwBonus`. Not named.
- `$14` in `setplayer` is scratch around the roster index. Not named.
- `CODE_9EB3C4`, `CODE_9FD459` and `CODE_9FA1B7` are entries other slices jump to, so they stay global.
- `PenOffsides` is `$12` here. 93S uses `$10`. The 94S immediate is the one in the source.
- SpriteFrameN labels stay numbered until a frame has an SPF name.
- The asset rows marked missing or name in `docs/cleanup_plan.md` are not identified yet.
- The animation list in `src/data/frames94s.asm` has the same shape as the 94G list (eight direction pointers, then frame and time words) but the frame numbers are not the 94G SPF values, so those SPA names are not applied. `DATA8_9DE0FC` stays until that match is clear.
- The remaining `CODE_` entries (1849 labels, 982 files) did not uniquely match a 93S or 94G routine. Opcode identity across the two ROMs is rare, and several names collided on the same prologue, so those stay placeholders until a caller shows the job.
- `DATA8_` blocks that are still cursors, packed bytes, or a second copy of a named table stay unnamed. `AttribMenuSkater` and `AttribMenuGoalie` keep those names. The shooter list and the line screen have their own column lists, `ShooterAttribColumns` and `SkaterAttribColumns`. Phrases in `DATA8_9CF000` that are a title are named. Cursor-only records in that bank stay `DATA8_`.
- Rejected matches, left as `CODE_`: `printbig`, `getpde`, `Pausemode`, `assscore`, `sroot`, `doshot`, `AttribRating`. `CODE_9B9F7A` is not `updatecrowdf`. `CODE_9C9930` is not `updatesound`. `CODE_9BB370` is the random range `randomd0` calls, and its body is an 8-bit path plus a 16-bit path, not 93S `randoma`. `CODE_9F8330` contains the `StartGame` penalty-option sequence and then the replay setup. `CODE_9FBAAA` builds the frame sprites (`show_rink`, `showclock`, `showzam`) without the 93S vblank gate. `CODE_9D8000` is called where 93S calls `Framer`. `CODE_9ECFC6` is called where 93S calls `PrintStringFromList`. `CODE_9E828B` is the other-team half of `chkpk2`, then unlabeled bytes. `CODE_9F8DFA` is a shared register-save prologue, not one routine.
- `$7E35D0` is the blank tile `EraseScoutName` stores the way 93S stores `blankchar`. Not named.
- `#$0800` and `#$0040` stay raw except `showclock` (`sf2replay`) and `freezewindow` (`sfslock`). `#$2000` and `#$4000` stay raw except `chkpk` (`sf2pwrplay`) and `chkpk2` (`sf2pwrtm`).

## Alignment

- Audit is `docs/align_plan.md`. The team database in `src/data/teamdata94s.asm` covers the old bank9C B000/C000/D000 range; screen text continues at `$9CEF59`.
- Layout done: banks `$80` through `$9F` are `src/banks/` files. Code banks are `b80_engine`, `b9B_screens`, `b9C_teams`, `b9D_roster`, `b9E_game` and `b9F_flow`. Routines are in `src/routines/`, tables in `src/data/tables/`. The SNES header is `src/header/snes_header.asm`. `tools/verify_all.sh` MATCH.
- Abbreviation labels now follow the team-record strings: ANH, LA, NJ, OTW, SJ, TB (30 names in `docs/name_map.csv`).
- `adda43` shares a file with `CODE_9BB176` because that routine falls through into it. `setteams` shares `ClearTeamStats` for the same reason.
- Two entries in bank `$9F` had no label. They are `AttribWeight` and `puckfaceoff2` (rows in `docs/name_map.csv`).
- Headers: named routines have a one-line header. Unnamed `CODE_` slices keep the unidentified placeholder. Penalty, hockey, shootout and the matched `routines/snes` entries are named.
- Sprite animation sequences are `src/data/frames94s.asm` (the label is still `DATA8_9DE0FC`).

## State

- Full build MATCH (SHA-1 `10dcd21be9c5542e82b0b94473bf5ff569b36cf5`); `tools/verify_all.sh` MATCH.
- Banks $80 to $9F are source (MATCH): every segment of the ROM is source.
- Data assets: binaries are extracted to `Extracted/` by `tools/prebuild.py` (formats in `src/data/README.md`).
  `tools/extract.py` has the `ASSETS` list (name, first address, end exclusive). The text tables are source files in
  `src/data/text/`, one per table, included where they sit in the ROM; nine take their 93S names (AttribMenuSkater,
  AttribMenuGoalie, PositionNames, GameLabels, PasstoText, StatusTextTbl, HandedTextTbl, GoalBoxText, RosterLineNames).
  The team database (TeamList, the team records, playoffseats) is `src/data/teamdata94s.asm`, included from
  `src/banks/b9C_teams.asm`. `DATA8_80D3EB` is `src/data/tables/DATA8_80D3EB.asm`.
- The notes below still say `bank80_8000` and the other old slice names. That code now lives in `src/routines/` and
  `src/data/tables/`, included from `src/banks/`.
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
  bank81_B000 to bank81_F000 continue it (`incbin "data/gfx/TeamLogos.spr.huf":<start>..<end>`; bank81_F000
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
  sprite frames (team index: CenterIceTilesHFD (9) at $82FEA9, CenterIceTilesPIT (17) at $83FF47, CenterIceTilesDAL (5) at $84FF38, CenterIceTilesVAN (23) at $86FE78, CenterIceTilesCGY (3) at $8DFF3D, CenterIceTilesTBL (21) at $97FE85, CenterIceTilesNYI (13) at $98FECB, CenterIceTilesOTT (15) at $99FEC0; the rest are in bank $9A). Team index = the logo order of
  TeamLogoSprites.
- $9DCD53 is a table of long pointers read at $9DC9DD and $9DCC65 as (team $1C98 * 26 + $A5) * 4: 28 rows of 26 packed
  entries that are unpacked and converted with $9B85C2: player photos, 6 x 6 tiles (checked: DATA8_8CFDEC, entry 390,
  renders as a face; whether the column is the roster index is not checked). After the 28 rows,
  entries point at 16-word tables: $9AF47C, $85FFDF (DATA8_85FFDF), $9AEA5C, ... at $20 steps, which share their first
  words (palettes?); no reader of these found yet.
- DATA8_87FF91 (bank87_F000): an LZ block, unpacked a 10 x 12 byte map after three words (10, 12, 16); $9DB6D7 unpacks it
  to $7F0000 and then unpacks $9ADEE0 to $7F4000 and $91B188 to $7F5000; what reads the map is not traced.
- CenterIceMapNHL ($88FFC6, bank88_F000) is the centre ice map of teams 26 and 27 (the all-star teams), with the tiles at
  $9AD4B6: the NHL shield.
- $9DE0BD loads colours into CGRAM: [$0C] the colours, Y the first colour, X the count (team palettes: Y = $A0).
  DATA8_89FFC7 (bank89_F000) is an LZ-packed palette that $9DC8E4 loads at colour $40; its screen is not identified.
- DATA8_8AFF7A (bank8A_F000) has the layout of DATA8_87FF91 unpacked (10 x 12 byte map after three words) and is read at
  $9DB635, near the code that unpacks DATA8_87FF91; both are likely tile pictures of one screen, not identified yet.
- Songs at bank ends: DATA8_81FE45 (bank81_F000) and DATA8_8BFE74 (bank8B_F000, TeamSongs entries 31, 32, 79), both
  header + TRAK chunks "left"/"right"; the note bytes are not decoded yet.
- Sound uploads: DATA8_80E6C1 (15 entries) and DATA8_80E6FD (16) in bank80_E000 are lists of long pointers to blocks for
  SPCUploadBlock ($809906: big-endian sound RAM address and length, then the bytes). $9C9860 and $9C97B0 set the sound effect
  table ([$34] = $9BB4C9), call SoundInit and send every block of one list; $9C9800 sends DATA8_80E73D (one block, $8F8000)
  with [$34] = $80E741, so the data from $80E741 in bank80_E000 is a sound effect table (still plain db). The blocks are
  probably samples and sound data; DATA8_8ED897 (bank8E_D000-F000, asset DATA8_8ED897.spc) is one of them.
- Songs: the TRAK chunk size before each "TRAK" tag is a big-endian word (DATA8_8EFD2B has $0166); in bank81_F000 and
  bank8B_F000 its high byte $00 is written at the end of the padding.
- Bank $8F: DATA8_8F8000 ($8F8000-$8FBB25, upload block of DATA8_80E73D), DATA8_8FBB26 ($8FBB26-$8FDD31, upload block in a
  long pointer list near $9C9A5B), DATA8_8FDD32 ($8FDD32-$8FFE73, a song with 13 tracks named timp, orch, BASS #2, ...;
  no pointer to it found), DATA8_8FFE74 ($8FFE74-$8FFFEE, the player photo that most photo-table entries without their own
  photo share: a generic skater), then $FF fill.
- Next: naming passes. Code banks $9B to $9F (and parts of $80) still use auto labels (CODE_/DATA8_) for most routines and tables; match them to NHLPA93SNES / NHL94Genesis names, name RAM variables, and turn the remaining numeric pointers (for example in the sprite animation sequences of bank9D_E000 and the word pointer tables) into labels.

## Setup notes

- asar 1.91 on PATH or in `tools/bin/` (`tools/setup.sh`). Python 3.
- ROM at `lst/nhl94snes.sfc`. `output/` is generated and gitignored.
- The Vault's export (patches off) differs from this ROM in 344 bytes inside $D8000-$FFFFF; the quick pass only uses its code map
  where the bytes decode the same way.
- Windows: `python3` may be the Microsoft Store stub; put a `python3` wrapper for the real Python first on PATH before
  `./build.sh` in Git Bash, or use `build.ps1`.
