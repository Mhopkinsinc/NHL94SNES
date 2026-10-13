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
