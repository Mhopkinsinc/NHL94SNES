; Unidentified routine.
CODE_9F9A9E:
	tax
	lda.w #$0007
CODE_9F9AA2:
	jsl.l DivX8U
	clc
	adc.b $A5
	sta.b $A5
	lda.b $A5
	bpl CODE_9F9AB4
	stz.b $A5
	lda.w #$0000
CODE_9F9AB4:
	sta.b $A5
	plx
	lda.b $08
	beq CODE_9F9ABD
	lsr.b $A5
CODE_9F9ABD:
	lda.b $A7
	bne CODE_9F9AD7
	lda.b $A5
	cmp.w #$0064
	bcc CODE_9F9ACB
	lda.w #$0064
CODE_9F9ACB:
	cmp.w #$0032
	bcs CODE_9F9AD5
	lsr a
	clc
	adc.w #$0019
CODE_9F9AD5:
	sta.b $A5
CODE_9F9AD7:
	rtl
