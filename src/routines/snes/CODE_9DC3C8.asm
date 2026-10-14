; Unidentified routine.
CODE_9DC3C8:
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$000A
	sta.b d1
	jsl.l CODE_9DC3DB
CODE_9DC3DA:
	rtl
