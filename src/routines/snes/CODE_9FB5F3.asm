; Unidentified routine.
CODE_9FB5F3:
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9FB5CD
	tay
	lda.w $19EC,y
	rtl
