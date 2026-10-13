; Unidentified routine.
CODE_9C8CE5:
	sep #$20
	lda.w $1956,y
	cmp.w $1956,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
	bra CODE_9C8D03
