; Unidentified routine.
CODE_9E97DD:
	sty.b $91
	cpy.w $0AD9
	beq CODE_9E97F6
	cpy.w #$0018
	bcs CODE_9E97F6
	lda.w position,y
	bmi CODE_9E97F6
	lda.w $1563,y
	ora.w $1203,y
	beq CODE_9E97FD
CODE_9E97F6:
	rtl
