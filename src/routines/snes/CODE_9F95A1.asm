; Unidentified routine.
CODE_9F95A1:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F9564
	jsl.l CODE_9BC623
	ldx.w #$000E
CODE_9F95B0:
	lda.l $7E3508,x
	sta.l $7E3518,x
	dex
	dex
	bpl CODE_9F95B0
	lda.w #$0004
	tsb.w sflags3
CODE_9F95C2:
	stz.w $0ACF
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
	stz.b $B1
CODE_9F95D0:
	ldx.b $89
	lda.l $7E3548,x
	cmp.w #$0004
	beq CODE_9F95E5
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b $B1
CODE_9F95E5:
	lda.b $89
	lda.w #$0000
	sta.l $7E3548,x
	sta.l $7E3558,x
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F95D0
	lda.b $AD
	asl a
	tax
	lda.l DATA8_80DA26,x
	tax
	dec a
	and.w $0AD5
	sta.w $0AD5
	lda.b $B1
	jsl.l Mul16U
	lda.b $08
	tsb.w $0AD5
	lda.l $7E35D4
	inc a
	sta.l $7E35D4
CODE_9F961E:
	rtl
