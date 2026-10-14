; Unidentified routine.
CODE_9E97DD:
	sty.b a2
	cpy.w $0AD9
	beq .rtl
	cpy.w #$0018
	bcs .rtl
	lda.w position,y
	bmi .rtl
	lda.w $1563,y
	ora.w $1203,y
	beq CODE_9E97FD
.rtl:
	rtl
