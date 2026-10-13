; Unidentified routine.
CODE_9FF055:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF05B:
	jsl.l CODE_9B865F
	lda.w $1DB9
	rtl
