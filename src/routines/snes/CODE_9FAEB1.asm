; Unidentified routine.
CODE_9FAEB1:
	lda.b d7
	sta.b tmp0
	cmp.w $1003,x
	bmi CODE_9FAEBF
	lda.w #$0001
	sta.b tmp0
CODE_9FAEBF:
	lda.w $1003,x
	sec
	sbc.b tmp0
	sta.w $1003,x
	bpl updatefaceoff
	lda.w $1E9B
	beq CODE_9FAED6
	jsl.l CODE_9FB092
	jmp.w CODE_9FAFBE
