; Unidentified routine.
CODE_9DCB37:
	jsl.l CODE_9DCB53
	bne .t1
	lda.w #$0005
	sta.b d1
	bra CODE_9DCB49

.t1:
	lda.w #$0004
	sta.b d1
CODE_9DCB49:
	jsl.l CODE_9DC561
	lda.b d0
	and.w #$0001
	rtl
