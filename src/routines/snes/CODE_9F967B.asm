; Unidentified routine.
CODE_9F967B:
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9F96B8
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9F96B8
	ldx.w #$0000
CODE_9F9698:
	phx
	lda.w $1C84,x
	beq .t1
	txa
	lsr a
	jsl.l CODE_9B84DC
	lda.b d3
	bit.w #$1000
	beq .t1
	pla
	jmp.w CODE_9F936C

.t1:
	plx
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F9698
	rtl
