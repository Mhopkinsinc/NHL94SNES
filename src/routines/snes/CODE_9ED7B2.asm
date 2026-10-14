; Unidentified routine.
CODE_9ED7B2:
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq .1
	ora.w #$FF80
.1:
	clc
	adc.w puckx
	sta.b d0
	bra CODE_9ED7E7
