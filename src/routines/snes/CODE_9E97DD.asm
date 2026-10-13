; Unidentified routine.
CODE_9E97DD:
	sty.b $91
	cpy.w puckc
	beq CODE_9E97F6
	cpy.w #$0018
	bcs CODE_9E97F6
	lda.w position,y
	bmi CODE_9E97F6
	lda.w pfnc,y
	ora.w nopuck,y
	beq CODE_9E97FD
CODE_9E97F6:
	rtl
