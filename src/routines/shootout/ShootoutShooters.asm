; Unidentified routine.
ShootoutShooters:	; the screen where team $91 picks its goalie and shooters; tmgoalie is set from the list on exit
	jsl.l CODE_9DE0E9
	lda.w #$0001
	sta.b $A5
	lda.b $91
	beq CODE_80CA1D
	lda.w #$0002
	sta.b $A5
CODE_80CA1D:
	lda.w $1C84
	cmp.b $A5
	beq CODE_80CA2E
	lda.w $1C86
	cmp.b $A5
	beq CODE_80CA2E
	jmp.w CODE_80CA9C
