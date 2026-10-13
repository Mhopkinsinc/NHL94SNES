; Unidentified routine.
CODE_9E9E8A:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9E9E96
	sta.w $19BE
CODE_9E9E96:
	ldx.b $91
	lda.w #$FF7E
	sta.w Xpos,x
	lda.w #$0000
	sta.w $0EC3,x
	lda.w attribute,x
	bit.w #$0800
	bne CODE_9E9EB1
	lda.w #$FE60
	bra CODE_9E9EB4
