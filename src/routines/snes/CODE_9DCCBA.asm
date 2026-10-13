; Unidentified routine.
CODE_9DCCBA:
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	stx.b $14
	tya
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $14
	asl a
	adc.b $10
	sta.b $10
	lda.w #$0006
	sta.b $14
CODE_9DCCD8:
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$000C
	jsl.l CODE_808EDF
	lda.b $10
	clc
	adc.w #$0040
	sta.b $10
	dec.b $14
	bne CODE_9DCCD8
	rtl
