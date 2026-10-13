; Unidentified routine.
CODE_9ED7B2:
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9ED7C2
	ora.w #$FF80
CODE_9ED7C2:
	clc
	adc.w puckx
	sta.b $A5
	bra CODE_9ED7E7
