; Unidentified routine.
CODE_9FAEB1:
	lda.b $C1
	sta.b $C5
	cmp.w $1003,x
	bmi CODE_9FAEBF
	lda.w #$0001
	sta.b $C5
CODE_9FAEBF:
	lda.w $1003,x
	sec
	sbc.b $C5
	sta.w $1003,x
	bpl CODE_9FAF1E
	lda.w $1E9B
	beq CODE_9FAED6
	jsl.l CODE_9FB092
	jmp.w $AFBE
