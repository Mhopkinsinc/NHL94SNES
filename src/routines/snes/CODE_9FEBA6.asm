; Unidentified routine.
CODE_9FEBA6:
	lda.w #$009F
	sta.b $97
	lda.w #$EC7E
	sta.b a3
	lda.w $1EB7
	asl a
	clc
	adc.b a3
	sta.b a3
	lda.b [a3]
	cmp.b d0
	beq CODE_9FEBC2
	jmp.w CODE_9FEBA5
