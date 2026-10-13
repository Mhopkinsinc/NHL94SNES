; Unidentified routine.
CODE_9FCB5C:
	ldy.b $A5
	lda.w $19D4,y
	bpl CODE_9FCB67
	jsl.l CODE_9FCB68
CODE_9FCB67:
	rtl
