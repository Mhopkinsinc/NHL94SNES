; Unidentified routine.
CODE_9FB5E5:
	lda.w #$0000
	sta.b a2
	jsl.l CODE_9FB5CD
	tay
	lda.w $19EC,y
	rtl
