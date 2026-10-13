; Unidentified routine.
CODE_80AD64:
	cpy.b #$04
	bne CODE_80AD89
	rep #$20
	ldy.b #$10
	lda.w $093A,x
	sec
	sbc.b ($4E),y
	sta.w $093A,x
	bcs CODE_80AD80
	sep #$20
	ldy.b $4B
	jsr.w CODE_80ABC7
	bra CODE_80AD90
