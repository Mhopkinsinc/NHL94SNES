; Unidentified routine.
CODE_9FCB5C:
	ldy.b d0
	lda.w $19D4,y
	bpl .rtl
	jsl.l CODE_9FCB68
.rtl:
	rtl
