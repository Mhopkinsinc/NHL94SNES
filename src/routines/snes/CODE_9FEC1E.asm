; Unidentified routine.
CODE_9FEC1E:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC5B
	sta.b a4
CODE_9FEC28:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
