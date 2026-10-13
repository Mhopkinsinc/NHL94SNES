; Unidentified routine.
CODE_9FD8B6:
	lda.w position,x
	bne CODE_9FD8C4
	lda.w $0B05,x
	ora.w #$0003
	sta.w $0B05,x
CODE_9FD8C4:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9FD8D2
	jmp.w $D99D
