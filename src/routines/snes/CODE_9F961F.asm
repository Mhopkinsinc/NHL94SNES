; Unidentified routine.
CODE_9F961F:
	stz.b $B1
CODE_9F9621:
	ldx.b $89
	lda.l $7E3588,x
	cmp.l $7E3578,x
	bcc CODE_9F9637
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b $B1
CODE_9F9637:
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F964E
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	eor.b $B1
	sta.b $B1
CODE_9F964E:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F9621
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
	rtl
