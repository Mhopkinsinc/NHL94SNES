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
position = $0F43	; player's position (0=goalie,1=l.def,2=r.def,3=l.wing,4=center,5=r.wing; negative = none)
SPA = $11A3		; current animation (offset into the animation data)
SPAnum = $11C3		; index into animation (4 per frame)
SPAcnt = $11E3		; count down to the next animation frame (-1 = restart)
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
