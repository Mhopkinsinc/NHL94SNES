; Unidentified routine.
CODE_9EC8CE:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
CODE_9EC8E7:
	lda.b [$0C]
	and.w #$00FF
	beq CODE_9EC902
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dec.b $22
	bne CODE_9EC8E7
CODE_9EC901:
	rtl
