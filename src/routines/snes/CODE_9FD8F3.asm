; Unidentified routine.
CODE_9FD8F3:
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b d0
	sec
	sbc.w #$0020
	beq CODE_9FD907
	bmi CODE_9FD907
	jmp.w CODE_9FD99D
