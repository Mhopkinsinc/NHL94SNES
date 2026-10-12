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
