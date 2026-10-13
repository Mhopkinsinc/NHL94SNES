; Unidentified routine.
CODE_9DD977:
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0800
	jsl.l CODE_808EDF
	rtl
