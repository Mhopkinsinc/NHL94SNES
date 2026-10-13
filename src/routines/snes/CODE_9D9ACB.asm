; Unidentified routine.
CODE_9D9ACB:
	lda.b $08
	asl a
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	sta.b $06
	lda.l $7E3466
	jsr.w $9BFC
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w $9BFC
	ldx.b $08
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9B07:
	clc
	adc.b $14
	cmp.w #$0008
	bcc CODE_9D9B59
CODE_9D9B0F:
	jsl.l $001D59
	inc.w printx
	lda.b $06
	sta.b $04
	lda.l $7E3466
	inc a
	inc a
	sta.l $7E3466
	lda.b $08
	bmi CODE_9D9B79
	cmp.w #$0020
	beq CODE_9D9B59
	lda.b $14
	eor.w #$0007
	sta.b $16
	asl a
	sta.b $0A
	lda.l $7E3466
	jsr.w $9C2A
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w $9C2A
CODE_9D9B59:
	ldx.b $08
	cmp.w #$0020
	bne CODE_9D9B65
	lda.w #$0005
	bra CODE_9D9B6C
