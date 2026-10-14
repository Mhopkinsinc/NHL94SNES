; Unidentified routine.
CODE_9F95A1:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9F9564
	jsl.l WritePassBits
	ldx.w #$000E
CODE_9F95B0:
	lda.l passbits,x
	sta.l $7E3518,x
	dex
	dex
	bpl CODE_9F95B0
	lda.w #$0004
	tsb.w sflags3
CODE_9F95C2:
	stz.w $0ACF
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
	stz.b d3
CODE_9F95D0:
	ldx.b a0
	lda.l $7E3548,x
	cmp.w #$0004
	beq CODE_9F95E5
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b d3
CODE_9F95E5:
	lda.b a0
	lda.w #$0000
	sta.l $7E3548,x
	sta.l $7E3558,x
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9F95D0
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
CODE_9F961E:
	rtl
