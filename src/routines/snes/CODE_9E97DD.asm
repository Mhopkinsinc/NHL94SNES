; Unidentified routine.
CODE_9E97DD:
	sty.b a2
	cpy.w puckc
	beq .rtl
	cpy.w #$0018
	bcs .rtl
	lda.w position,y
	bmi .rtl
	lda.w pfnc,y
	ora.w nopuck,y
	beq CODE_9E97FD
.rtl:
	rtl
