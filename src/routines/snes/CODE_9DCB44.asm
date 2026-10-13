; Unidentified routine.
CODE_9DCB44:
	lda.w #$0004
	sta.b $A9
CODE_9DCB49:
	jsl.l CODE_9DC561
	lda.b $A5
	and.w #$0001
	rtl
