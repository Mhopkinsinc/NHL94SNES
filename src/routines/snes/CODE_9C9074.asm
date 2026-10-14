; Unidentified routine.
CODE_9C9074:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	jmp.w CODE_9C9154
