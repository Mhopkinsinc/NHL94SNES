; Unidentified routine.
CODE_9FF1D1:
	lda.w $1A0E
	beq CODE_9FF1E3
CODE_9FF1D6:
	jsl.l CODE_9FF1E4
	lda.w $1A0E
	bne CODE_9FF1D6
	jsl.l CODE_9FEA24
CODE_9FF1E3:
	rtl
