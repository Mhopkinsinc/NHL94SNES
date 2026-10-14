; Unidentified routine.
CODE_9F961F:
	stz.b d3
.loop:
	ldx.b a0
	lda.l $7E3588,x
	cmp.l $7E3578,x
	bcc .1
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b d3
.1:
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0001
	beq .2
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	eor.b d3
	sta.b d3
.2:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loop
	lda.b d2
	asl a
	tax
	lda.l DATA8_80DA26,x
	tax
	dec a
	and.w $0AD5
	sta.w $0AD5
	lda.b d3
	jsl.l Mul16U
	lda.b $08
	tsb.w $0AD5
	lda.l $7E35D4
	inc a
	sta.l $7E35D4
	rtl
