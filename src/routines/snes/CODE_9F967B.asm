; Unidentified routine.
CODE_9F967B:
	lda.l $7E34BC
	cmp.w #$0004
	bne .2
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq .2
	ldx.w #$0000
.1:
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
	bcc .1
	rtl
.2:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne .3
	jsl.l CODE_9B84F5
	lda.b d1
	bit.w #$1000
	beq .t1x
	jmp.w CODE_9F9372

.t1x:
	lda.b d1
	bne .4
.3:
	rtl
.4:
	stz.w $0AD1
	stz.w $07C6
	jml.l Restart
