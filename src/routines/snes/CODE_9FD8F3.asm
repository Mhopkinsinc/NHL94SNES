; Unidentified routine.
CODE_9FD8F3:
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b $A5
	sec
	sbc.w #$0020
	beq CODE_9FD907
	bmi CODE_9FD907
	jmp.w $D99D
