; Work RAM of NHL '94 SNES. Equates only, no bytes; one name per address.
JoyPad = $0776		; joypad 1 buttons held
HeapStart7E = $07A0		; first block header of the bank $7E heap
HeapStart7F = $07A2		; first block header of the bank $7F heap
NewHandleSlot = $07A4		; NewHandle: the free handle being filled
NewHandleSkipBank = $07A6	; NewHandle: the bank it must not use
HandleTable = $7E2000		; handles of 4 bytes: address word, bank word (0,0 = free)
SPCStreamLeft = $7E35E2		; bytes of the sound stream still to send
SPCStreamPtr = $7E35EC		; long pointer to the next stream byte (address word, bank word)
