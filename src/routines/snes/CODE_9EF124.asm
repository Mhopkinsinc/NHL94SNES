; Unidentified routine.
CODE_9EF124:
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
CODE_9EF135:
	lda.w $0AD9
	bmi CODE_9EF13B
	lsr a
CODE_9EF13B:
	sta.b d2
	bpl CODE_9EF142
	jmp.w CODE_9EF1CE
