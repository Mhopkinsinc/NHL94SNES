; Unidentified routine.
CODE_9DBCF8:
	stz.w $0BD5
	ldx.w #$0000
	lda.w #$0000
CODE_9DBD01:
	jsl.l RandomWord
	and.w #$001F
	cmp.w #$001A
	bcs CODE_9DBD01
	phx
	ldx.w #$0000
.loop:
	cpx.w $0BD5
	bcs .t2
	cmp.l $7EF000,x
	beq .t1
	inx
	inx
	bra .loop

.t1:
	plx
	bra CODE_9DBD01

.t2:
	plx
	sta.l $7EF000,x
	inx
	inx
	stx.w $0BD5
	cpx.w #$0034
	bcc CODE_9DBD01
	stz.w $0BD5
	rts
