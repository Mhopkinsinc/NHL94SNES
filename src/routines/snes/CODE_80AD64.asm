; Unidentified routine.
CODE_80AD64:
	cpy.b #$04
	bne .t2
	rep #$20
	ldy.b #$10
	lda.w $093A,x
	sec
	sbc.b ($4E),y
	sta.w $093A,x
	bcs .t1
	sep #$20
	ldy.b $4B
	jsr.w CODE_80ABC7
	bra CODE_80AD90

.t1:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
	bra CODE_80AD90

.t2:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4E3
CODE_80AD90:
	sep #$20
	inx
	inx
	iny
	cpy.b #$08
	bcs .t1
	jmp.w CODE_80AC7E

.t1:
	rts
