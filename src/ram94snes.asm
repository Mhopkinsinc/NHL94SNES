; Work RAM of NHL '94 SNES. Equates only, no bytes; one name per address.
JoyPad = $0776		; joypad 1 buttons held
HeapStart7E = $07A0		; first block header of the bank $7E heap
HeapStart7F = $07A2		; first block header of the bank $7F heap
NewHandleSlot = $07A4		; NewHandle: the free handle being filled
NewHandleSkipBank = $07A6	; NewHandle: the bank it must not use
HandleTable = $7E2000		; handles of 4 bytes: address word, bank word (0,0 = free)
SPCStreamLeft = $7E35E2		; bytes of the sound stream still to send
SPCStreamPtr = $7E35EC		; long pointer to the next stream byte (address word, bank word)
SoundLock = $07E5		; nonzero: SoundUpdate does nothing (decremented around sound work)
MusicOn = $07F3			; nonzero while a song plays
SoundVolume = $07F7		; master volume; its high byte goes to the sound driver
SoundFadeSpeed = $07F9		; subtracted from SoundVolume each frame; at 0 the sound is reset
OAMReady = $0766		; nonzero: the NMI copies the OAM buffer at OAMShowBuf to OAM
OAMLastEnd = $07A8		; OAMNext of the frame last finished
OAMDrawBuf = $07AA		; OAM buffer (bank $7E) the sprites are drawn into
OAMShowBuf = $07AC		; OAM buffer (bank $7E) the NMI copies
SpritesLeft = $07AE		; OAM entries still free this frame
OAMHiPtr = $07B0		; byte of the OAM high table that takes the next entry's size and X high bits
OAMHiShift = $07B2		; position of the next entry in that byte, 3 down to 0
SpriteVRAM = $07B4		; VRAM word address of sprite tile 0
SpritesReserved = $07B6		; OAM entries at the start that the sprite drawing leaves alone
OAMNext = $07BC			; next OAM entry to fill in OAMDrawBuf
OAMHideEnd = $07BE		; SpriteFrameEnd moves the entries from OAMNext up to here off screen
homeshooters = $1D71		; home shootout list: the goalie, then the shooters (bytes, player number + 1)
awayshooters = $1D79		; away shootout list, as homeshooters
shootoutround = $1D85		; shootout round, from 1
Hscroll = $0CED		; horizontal scroll
iflags = $0CF1		; icing flags (if* masks)
passdir = $0D03		; direction for pass/shot 0-7 (8 = none)
passspeed = $0D05	; speed of pass/shot
mesarea = $0A2A		; string being built: a length word, then the bytes
mesareaEnd = $0A48	; one past the last digit PushNumber and PushTime may write
puckc = $0AD9		; object index of the puck carrier, negative = loose
gmStatBase = $1742	; first word ClearTeamStats clears (through $18ED)
playoffRoundIdx = $7E35D4	; playoff round for other scores and password bits
printx = $0D0F		; x cordinate for printing (text map column)
printy = $0D11		; y cordinate for printing
ReplayBufferPtr = $0D1F	; long pointer to the next replay frame record
Vscroll = $0D39		; vertical scroll (low 3 bits = BG2 fine scroll)
Xpos = $0D55		; x position (integer part) of each object
Ypos = $0DB7		; y position (integer part) of each object
pucky = $0DD3		; puck y position
puckvx = $0EDF		; puck x speed
puckvy = $0EFF		; puck y speed
; Sort objects: a word per object in each array, 16 objects ($20 bytes; Xpos and Ypos have a 17th, the replay
; cursor point), indexed by object * 2. The 93S struct order: 94S keeps height only for the puck (puckz ...) and
; drops Zvel, limpact and pf2fight.
Xfrac = $0D77		; fraction of Xpos
Yfrac = $0DD9		; fraction of Ypos
puckz = $0DF9		; puck height (93S Zpos+puckobj)
shadowz = $0DFB		; height of object 15, the puck shadow (setsortcords)
puckzfrac = $0DFD	; fraction of puckz
puckoldz = $0DFF		; puckz before this frame's move (93S OldZpos+puckobj)
puckvz = $0E01		; puck height speed (93S Zvel+puckobj)
oldframe = $0E23		; frame last drawn (setsortcords)
OldXpos = $0E43		; Xpos before this frame's move
OldXfrac = $0E63
OldYpos = $0E83
OldYfrac = $0EA3
Xvel = $0EC3		; x speed (puckvx is Xvel+puckobj)
Yvel = $0EE3		; y speed
impactp = $0F03		; the other object (index) of the last collision or hold
impact = $0F23		; impact value, added to by collisions
temp1 = $1003		; assignment scratch, per object
temp2 = $1023
temp3 = $1043
temp4 = $1063
temp5 = $1083
temp2b = $10A3
radiusx = $10C3		; collision width (InitSortObjects)
radiusy = $10E3		; collision height
SCnum = $1143		; object number (index / 2)
facefrac = $1183	; turn fraction of facedir (doplayeracc)
nopuck = $1203		; no puck collision until zero
nopuckb = $1223		; second count down
; player attributes, stored by setplayer in the 93S order
weight = $12C3
legstr = $12E3
legspd = $1303
aioff = $1323
aidef = $1343
shotspd = $1363
shotacc = $1383
passacc = $13A3		; passacc (goalies: glove save right)
rostnum = $13C3
spodds = $13E3		; shot / pass odds
stickhand = $1403
endurance = $1423	; endurance (goalies: stick save right)
GGSleft = $1443		; goalie glove save left
fightagg = $1463		; fighting aggression (stored; 94S has no fights)
aggress = $1483
handed = $14A3		; nonzero: right handed
pfrev = $1523		; nonzero: skating backwards. pflags bit pfrev
pf2aip = $1543		; nonzero: animation in progress. pflags2 bit pf2aip
pfnc = $1563		; nonzero: no collision mode. pflags bit pfnc
position = $0F43	; player's position (0=goalie,1=l.def,2=r.def,3=l.wing,4=center,5=r.wing; negative = none)
SPA = $11A3		; current animation (offset into the animation data)
SPAnum = $11C3		; index into animation (4 per frame)
SPAcnt = $11E3		; count down to the next animation frame (-1 = restart)
frame = $0D97		; sprite frame number of each object (SPF groups); object 14 ($1C) is the puck, 15 ($1E) its shadow
facedir = $1163		; direction of facing, 0-7
assnum = $0F63		; index of the current assignment (0-7)
asslist = $0F83		; assignments, 8 bytes per object
newpos = $1243		; requested next position (negative = none)
newpnum = $1263		; requested next roster player (negative = none)
pflags = $1283		; pflags (bits 0-7) and pflags2 (bit n at bit n+10); some flags have their own arrays below
pnum = $12A3		; player's team location number (low byte)
pfgoal = $14C3		; nonzero: shoots at the top goal. pflags bit pfgoal
pfteam = $1503		; 0 = home, nonzero = visitors. pflags bit pfteam
gmode = $15D4		; game mode flags (gm* masks)
sflags = $15D8		; sflags (low byte) and sflags2 (high byte) as one word (sf*/sf2* masks)
sfhormode = $15DA	; nonzero: screen in horizontal mode. sflags bit sfhor
sflags3 = $15DC		; sflags3 (sf3* masks)
Pencntdwn = $1620	; penalty/fight count down (negative = fight over)
pentimer = $1622	; frames to the next penalty clock second (updatepentime)
PBnum = $1624		; players in the penalty boxes: home*16 + visitors
InjCntDown = $1626	; frames until the injury box is shown
penmsgtimer = $1628	; count down to reprinting the horizontal penalty message line
RefCnt = $162A		; ref graphics control (negative = idle)
RefStep = $162C		; step in the ref animation (negative = done)
gsp = $1630		; game period
tmsort = $1766		; first object index of the team
tmline = $1796		; current line
tmtouch1 = $179A	; pnum of the last touch
tmtouch2 = $179E	; second last touch
tmtouch3 = $17A2	; third last touch
tmap = $17A6		; active players on ice
tmgoalie = $17AA	; home and away goalie (words): low byte = goalie 0/1, $FFxx = pulled
tmflags = $17DE		; team flags
tmpde = $17EA		; energy of each roster player (word per player)
tmpdst = $1852		; bench/ice/box state of each roster player
tmboxlist = $18BA	; penalty box list of roster players (bytes, negative ends)
HomeTeam = $1C98	; home team number (TeamList index)
VisTeam = $1C9A		; visiting team number
tmdata = $1CDC		; team data address
OptPerlen = $7E34C2		; the period length option (index into GetPeriodTime_timetab)
HmAwBonus = $0CEF	; setplayer: home bonus / visitor penalty
PKBonus = $0D09		; setplayer: penalty kill bonus (negative)
PPBonus = $0D0B		; setplayer: power play bonus
attribute = $0E03	; frame attribute bits (attrxflip, attryflip)
Ylist = $1583		; y of each sort object
OOlistpos = $15A3	; position of each object in OOlist
OOlist = $15C3		; 16 bytes: object order list, bottom of the screen last
gameclock = $1632	; game clock seconds; gameclock+2 = jiffies

; Direct page the game logic uses as the 68k registers.
a0 = $89		; long pointer; a0+2 is the bank
a1 = $8D		; long pointer; a1+2 is the bank
a2 = $91		; team index, 0 = home
a3 = $95		; long pointer; a3+2 is the bank
d0 = $A5
d1 = $A9		; d1+2 is the high word
d2 = $AD
d7 = $C1		; frames elapsed, added into speeds
tmp0 = $C5		; scratch word; tmp0+1 is the next byte
tmp1 = $C7		; scratch word
tmp2 = $C9		; scratch byte; tmp2+1 is the next byte

Hpos = $0CEB		; ice rink horizontal position
Vpos = $0D37		; ice rink vertical position
xc1 = $0D4B		; scroll lock x
yc1 = $0D4D		; scroll lock y
printm = $0CD9		; offset of the print map in the text map
textdirtylo = $0CD5	; lowest changed word of the text map
textdirtyhi = $0CD7	; highest changed word of the text map
textmap = $7E37F4	; the text map
printfontset = $7E35A8	; tile base of the selected print font
RemapOut = $0A0A	; sixteen words: the tile RemapTiles is building

Playerdata = 0		; offset of the player list in a team record
ScoreOdds = 10		; offset of the scouting odds in a team record
puckobj = $1C		; object index of the puck
puckx = Xpos+puckobj	; puck x position

gmoffs = $0020		; offsides on
gmhl = $0010		; highlight mode
gmdir = $0002		; 0 = home team goes up
pfna = $0002		; new assignment
tmfoffside = $0010	; team flagged offsides
cbut = $0080		; shoot / check button in d2
blueline = $58		; puck y past which a team can be offside
PenOffsides = $12	; offsides penalty number
PenIcing = $0C		; icing penalty number
PenGoal = $0E		; goal

gmpen = $0004		; penalty called, ref in progress
sfpz = $0001		; pause mode
sfspdir = $0004		; a pass direction is set (passdir)
sfwrap = $0010		; replay has wrapped around
sf2drec = $0400		; disable replay record
sf2pwrplay = $2000	; power play in progress
sf2pwrtm = $4000	; 0 for team 1 in power play
sf2replay = $0800	; replay in progress
sf2refref = $0200	; ref needs refresh
sfslock = $0040		; scroll lock to xc1/yc1
sf3llcs = $0001		; lower line change box on screen
pf2inj = $0004		; injured
TMPDBENCH = $FFFE	; on the bench
TMPDOUT = $FFFD		; out of the game
rosterNone = $FFFC	; no roster slot (beside TMPDOUT in bench checks)
TMPDINJ = $1000		; injured: box time with this bit has no penalty
TMPDICE = $FFFF		; on the ice
PWrange = 30		; characters in PasstoText
pwlength = 16		; password characters
replaysize = $7A	; bytes per replay frame record

xsave = $87		; X saved around the push/pop loops
a4 = $99		; long pointer; a4+2 is the bank
d3 = $B1
d4 = $B5
d5 = $B9
d6 = $BD

gmclock = $15D6		; nonzero: game clock is stopped
PenBuf = $15DE		; up to 32 penalties: (penalty number, object) word pairs, 0 = free
RefPen = $162E		; penalty number of the ref animation
Oldrow = $0D23		; last rink map row
vramrow = $0D25		; BG2 tile map row at the top of the ring buffer
pfalock = $14E3		; nonzero: locked until the animation is done
PerTimeTotal = $1C82	; length of this period (seconds)
tmteam = $1CE0		; team number of each team struct
TempPlOffset = $1636	; pnum of the penalized player, high bit set for the visitors
OptPen = $7E34C4	; penalties (0 = off)
PassWord = $7E34F4	; password characters
passbits = $7E3508	; password bits, low word first
PlList = $7E3114	; players wanted on the ice
ReplayBufferStart = $7E577E	; first replay frame record
ReplayBufferEnd = $7EE676	; replay buffer end
VertLineScrolling = $0D49	; scouting report vertical scroll
PlayerScrollCtr = $0D3F		; scouting report player scroll
SelectedPlayerIdx = $0D43	; scouting report selected player
ScoutingReportTimer = $0D45	; scouting report timer
TestList = $7E347C		; scouting report text list
crowdlevel = $7E35E0	; crowd noise level: raised by the play, fades every frame
IniDispShadow = $0762	; INIDISP value the NMI writes (forced blank, brightness)
fadestep = $0AD1	; fade: a delay counting down to a fade in, or $FFFF to fade out (NMI)
brightness = $0AD3	; screen brightness 0-15 the fade sets; BrightnessHook writes it to INIDISP
pausepad = $0AC6	; the controller that owns the pause menu
Wallcos = $1103		; per object: cos of the angle of the last wall collision
Wallsin = $1123		; per object: sin of that angle
jmlvector = $1D59	; RAM jml trampoline: $5C (jml opcode), target at +1..+3
titleskip = $0BE9	; set when a pad press ends the title sequence
homelines = $1CE4	; the home team lines (7 lines of 8 slot bytes), loaded by LoadTeamLines, changed by the line editor
awaylines = $1D1C	; the visitors lines, as homelines
padlast = $0A9A		; 5 words: each pad's buttons at the last ReadPads
paddir = $0AA4		; 5 words: each pad's direction (PadDirection of the dpad bits)
padchange = $0AAE	; 5 words: each pad's buttons that changed at the last ReadPads
padnew = $0AB8		; 5 words: each pad's buttons newly pressed at the last ReadPads
CwdExciteLvl = $19BE	; crowd excitement: raised by hits and goals, set per playoff stage at a period start
CurCrowdMeter = $19C2	; the crowd meter in dB: sroot(CwdExciteLvl * 4) + 65, at most 128
CrowdPeak = $19C4	; the highest CurCrowdMeter of the game
palbuffer = $7E35F4	; the palette buffer (256 colours) sent to CGRAM
textmap2 = $7E3FF4	; the second text map (ClearTextMap2, SendTextMap2)
blankchar = $7E35D0	; vram tile of the blank character (eraser fills with it)
puckdist = $0B1D	; per object: distance to the puck (ApproxLength)
puckdist2 = $0B3D	; per object: about (dx^2 + dy^2) / 4 to the puck
puckdir = $0B5D		; per object: direction to the puck (vtoa)
streamsfx = $7E35E6	; the streamed sound effect asked for (1-6, StreamSfx), 0 none
streamstate = $7E35E8	; UpdateStreamSfx: 0 start, 1 streaming, 2 playing, 3 done
streamloaded = $7E35EA	; the streamed sound whose sample is in sound RAM
smallfontchars = $7E35B6	; vram tiles for the small font (print)
Framercset = $7E35BC	; vram tiles for the Framer box
scorechars = $7E35CE	; vram tiles for the scoreboard / team block maps
benchcheer = $0C23	; the bench that is cheering (StartBenchCheer), 0 none
benchframe = $0C29	; bench cheer frame: set * 8 + step, drawn by setsortcords; negative = none (kept in the replay)
dumpinplayer = $0BA3	; the player dumping the puck in (assdumpin), -1 none
dumpintarget = $0BA5	; assdumpin: the target index (DumpInTarget), a word offset into its x / y tables

; Sprite frame (SPF) groups: the first SpriteFrames frame of each group, named as the 93S / 94G groups (SPFskatewp
; to SPFhold match 93S frame for frame, then the 93S fight frames are gone). Frame numbers count from 1; the frame
; label is SpriteFrame_<group>_<n> and DrawSprite takes the frame number - 1.
SPFskatewp = 1		; 40 frames: skating with the puck, 5 per direction
SPFskate = 41		; 40 frames: skating, 5 per direction
SPFturnl = 81		; 8 frames: turning left
SPFturnr = 89		; 8 frames: turning right
SPFswing = 97		; 48 frames: shot and pass swings, 6 per direction
SPFstop = 145		; 16 frames: stopping
SPFskateb = 161		; 24 frames: skating backwards
SPFcelebrate = 185		; 16 frames: celebrating a goal
SPFpump = 201		; 16 frames: fist pump
SPFcup = 217		; 8 frames: holding the cup
SPFcupover = 225		; 8 frames: the cup alone: setsortcords draws SPFcupover+n in palette 0 over SPFcup+n (new in 94S)
SPFhipl = 233		; 8 frames: hip check left
SPFhipr = 241		; 8 frames: hip check right
SPFshoulderl = 249		; 8 frames: shoulder check left
SPFshoulderr = 257		; 8 frames: shoulder check right
SPFsweep = 265		; 16 frames: sweep check
SPFfallback = 281		; 32 frames: falling back
SPFfallfwd = 313		; 32 frames: falling forward
SPFduck = 345		; 8 frames: ducking
SPFhold = 353		; 8 frames: holding
SPFPen = 361		; 9 frames: over the boards (+0-+3 vertical, +4-+7 horizontal), then sitting: +7 horizontal and +8 vertical (assdopen)
SPFgwall = 370		; 4 frames: the goalie over the boards (SPAgwallright, SPAgwallleft; new in 94S)
SPFarrow = 374		; 15 frames: off-screen arrows, 3 per controller (setvideo)
SPFpad = 389		; 6 frames: stars: +0 the puck carrier, +1-+5 the controllers (setffo, PlayerSelect)
SPFreplay = 395		; 1 frame: the replay cursor: four corner marks round the player or point ReplayMode follows (setffo slot 6; confirmed in game)
SPFpuck = 396		; 11 frames: +0 the puck shadow, +1 the puck, then the flipping puck
SPFgoal = 407		; 2 frames: the two nets
SPFSiren = 409		; 14 frames: the goal light
SPFfaceoff = 423		; 10 frames: the big faceoff sprites (checkfo)
SPFsmallfont = 433		; 15 frames: 0-9, C, D, L, R, X (setffo, PlayerSelect)
SPFzamboni = 448		; 1 frame: the Zamboni (showzam)
SPFflip = 449		; 8 frames: flipping over
SPFstumble = 457		; 24 frames: stumbling
SPFhook = 481		; 16 frames: hooking
SPFcatch = 497		; 16 frames: catching a pass
SPFbglass = 513		; 5 frames: the glass breaking
SPFcrosscheck = 518		; 16 frames: cross check (SPAcrosscheck; new in 94S)
SPFGoalie = 534		; 112 frames: the goalie
SPFgready = 646		; 16 frames: the goalie ready, 2 per direction
SPFgdive = 662		; 16 frames: the goalie diving
SPFgpoke = 678		; 16 frames: the goalie poke check (new in 94S)
SPFgcover = 694		; 24 frames: the goalie covering the puck (new in 94S)
SPFgbutterfly = 718		; 24 frames: the goalie butterfly save (new in 94S)
SPFgsprawll = 742		; 24 frames: the goalie sprawling left (new in 94S)
SPFgsprawlr = 766		; 24 frames: the goalie sprawling right (new in 94S)
SPFpump2 = 790		; 31 frames: the second fist pump (SPApump2; new in 94S)
SPFunused = 821		; 11 frames: used only by SPAunused1 and SPAunused2, which nothing sets
SPFboardfront = 832		; 16 frames: checked into the boards, from the front (new in 94S)
SPFboardright = 848		; 16 frames: checked into the boards, from the right (new in 94S)
SPFboardback = 864		; 16 frames: checked into the boards, from behind (new in 94S)
SPFboardleft = 880		; 16 frames: checked into the boards, from the left (new in 94S)
SPFbenchcheck = 896		; 21 frames: checked into the bench (SPAbenchcheckr, SPAbenchcheckl; new in 94S)
SPFbench = 917		; 12 frames: the players on the bench cheering, 6 per bench (setsortcords)
SPFbigfont = 929		; 38 frames: A-Z, ., (c), 0-9 (PrintTeamSprites)
SPFhat = 967		; 9 frames: hat trick hats, 3 kinds of 3 frames (UpdateHatTrick)
SPFhatshadow = 976		; 1 frame: the hat shadow (UpdateHatTrick)

; Game variables from $0CD5 to $0D55, in the order 93S has them (names from the 93S routines that use them the same way)
collflag = $0CDB	; a player collision happened: checkcoll restores the old position (set by Bcheck, checkgoal)
impactstep = $0CDD	; d7*2: impact decay this game frame (Gameloop)
velstep = $0CDF		; d7*16: velocity to position scale this game frame
gravstep = $0CE1	; d7*96: gravity this game frame
pausetimer = $0CE3	; pause menu: frames left before a demo pause ends by itself
ThirdPBonus = $0CE5	; setplayer: +2 when tied or trailing late in the 3rd period
cheercnt = $0CE7	; crowd cheers still to play after a goal (one every 150 frames, Gameloop)
cheervc = $0CE9		; vcount of the last crowd cheer
lastplayer = $0CF3	; the last player who touched the puck (doshot, puckstick)
lldisp = $0CF7		; count down for the once-a-second screen / game updates (periodicevents)
nibblebuffer = $0CF9	; 4 words: the weights SetScore picks from
oldvcount = $0D01	; vcount at the last game frame (d7 = vcount - oldvcount)
passReceiverPlayerNum = $0D07	; the player the last pass was aimed at (negative = none)
printa = $0D0D		; attribute (palette / priority bits) for print characters
psfirst = $0D13		; pause menu: first item shown (Pmenu shows five from here)
psitem = $0D15		; pause menu item
puckcross = $0D17	; 2 entries of (x, frames): where / when the puck crosses the top / bottom goal line
shotplayer = $0D29	; the player who shot last (doshot)
sfxmutetime = $0D2B	; vcount of the last goal: Stop4Pen waits 60 frames after it
threat = $0D2D		; direction of threat on puck handler (nonzero = threat)
demoflag = $0D2F	; nonzero in demo mode
TickerNum = $0D31	; playoff game the score ticker shows next
tickervc = $0D33	; vcount when the ticker box was last shown
lastframevc = $0D35	; vcount of the last game frame (Gameloop)
wcradiusx = $0D3B	; wall collision radius x
wcradiusy = $0D3D	; wall collision radius y
screentimer = $0D41	; frames left on the scouting report screen
DispAttribCtr = $0D47	; text column (scouting report, line and shooter lists)
yleader = $0D4F		; lead distance on scrolling
vcountmark = $0D51	; 32-bit vcount snapshot: elapsed time base
