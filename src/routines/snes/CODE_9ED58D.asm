; Unidentified routine.
CODE_9ED58D:
	jsl.l vtoa
	lda.b d0
CODE_9ED593:
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #$E528
	jsl.l CODE_9EA3F1
	lda.w #$00F0
	sta.w $0BEB,x
	rtl
