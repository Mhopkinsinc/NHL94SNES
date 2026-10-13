; Unidentified routine.
CODE_9DC3C8:
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000A
	sta.b $A9
	jsl.l CODE_9DC3DB
CODE_9DC3DA:
	rtl
