; Unidentified routine.
CODE_80AA4F:
	lda.b $5E
	sep #$20
	asl a
	rep #$20
	sec
	sbc.w #$4000
	asl a
	sep #$20
	xba
	ldx.b $4A
	sta.w $088C,x
	sta.b $5C
	lda.w $089D,x
	bne CODE_80AA6D
CODE_80AA6A:
	jmp.w CODE_80AB06
