; Unidentified routine.
CODE_9FEC60:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC51
	sta.b a4
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
