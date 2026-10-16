; Bank $A0: the first bank of the 2 MB expansion (not in the retail ROM). Data moved out of full banks, then free space.
; Anything here is reached with long addressing (lda.l, [dp] with #Label>>16), never with a .w address from another bank.

org $A08000
%RelocShift()
incsrc "../data/tables/PlayerPhotoTable.asm"		; from bank $9D
incsrc "../data/tables/PhotoPaletteTable.asm"		; from bank $9D
FreeSpaceA0:
	%PadTo($A18000)
