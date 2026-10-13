; Unidentified routine.
CODE_9EDDD2:
	phx
	lda.w #$0108
	sta.b $B5
	ldy.w #$0000
	jsl.l CODE_9EDDF0
	lda.w #$FEF8
	sta.b $B5
	ldy.w #$0004
	jsl.l CODE_9EDDF0
	plx
	rtl
