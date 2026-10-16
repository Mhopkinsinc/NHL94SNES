; Banks $A1-$BF: free space of the 2 MB expansion. Add code or data after a bank's org, before its FreeSpace label;
; %PadTo fails the build if the bank overflows. Code here is reached with jsl / jml or long addressing.

org $A18000
%RelocShift()
FreeSpaceA1:
	%PadTo($A28000)

org $A28000
%RelocShift()
FreeSpaceA2:
	%PadTo($A38000)

org $A38000
%RelocShift()
FreeSpaceA3:
	%PadTo($A48000)

org $A48000
%RelocShift()
FreeSpaceA4:
	%PadTo($A58000)

org $A58000
%RelocShift()
FreeSpaceA5:
	%PadTo($A68000)

org $A68000
%RelocShift()
FreeSpaceA6:
	%PadTo($A78000)

org $A78000
%RelocShift()
FreeSpaceA7:
	%PadTo($A88000)

org $A88000
%RelocShift()
FreeSpaceA8:
	%PadTo($A98000)

org $A98000
%RelocShift()
FreeSpaceA9:
	%PadTo($AA8000)

org $AA8000
%RelocShift()
FreeSpaceAA:
	%PadTo($AB8000)

org $AB8000
%RelocShift()
FreeSpaceAB:
	%PadTo($AC8000)

org $AC8000
%RelocShift()
FreeSpaceAC:
	%PadTo($AD8000)

org $AD8000
%RelocShift()
FreeSpaceAD:
	%PadTo($AE8000)

org $AE8000
%RelocShift()
FreeSpaceAE:
	%PadTo($AF8000)

org $AF8000
%RelocShift()
FreeSpaceAF:
	%PadTo($B08000)

org $B08000
%RelocShift()
FreeSpaceB0:
	%PadTo($B18000)

org $B18000
%RelocShift()
FreeSpaceB1:
	%PadTo($B28000)

org $B28000
%RelocShift()
FreeSpaceB2:
	%PadTo($B38000)

org $B38000
%RelocShift()
FreeSpaceB3:
	%PadTo($B48000)

org $B48000
%RelocShift()
FreeSpaceB4:
	%PadTo($B58000)

org $B58000
%RelocShift()
FreeSpaceB5:
	%PadTo($B68000)

org $B68000
%RelocShift()
FreeSpaceB6:
	%PadTo($B78000)

org $B78000
%RelocShift()
FreeSpaceB7:
	%PadTo($B88000)

org $B88000
%RelocShift()
FreeSpaceB8:
	%PadTo($B98000)

org $B98000
%RelocShift()
FreeSpaceB9:
	%PadTo($BA8000)

org $BA8000
%RelocShift()
FreeSpaceBA:
	%PadTo($BB8000)

org $BB8000
%RelocShift()
FreeSpaceBB:
	%PadTo($BC8000)

org $BC8000
%RelocShift()
FreeSpaceBC:
	%PadTo($BD8000)

org $BD8000
%RelocShift()
FreeSpaceBD:
	%PadTo($BE8000)

org $BE8000
%RelocShift()
FreeSpaceBE:
	%PadTo($BF8000)

org $BF8000
%RelocShift()
FreeSpaceBF:
	%PadTo($C08000)
