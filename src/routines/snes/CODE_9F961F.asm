; Unidentified routine.
CODE_9F961F:
	stz.b d3
CODE_9F9621:
	ldx.b a0
	lda.l $7E3588,x
	cmp.l $7E3578,x
	bcc CODE_9F9637
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b d3
CODE_9F9637:
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F964E
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	eor.b d3
	sta.b d3
CODE_9F964E:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9F9621
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
