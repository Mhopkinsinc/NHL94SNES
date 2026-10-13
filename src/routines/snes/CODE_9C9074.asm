; Unidentified routine.
CODE_9C9074:
	lda.b [$89]
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l PushNumber
	jmp.w $9154
