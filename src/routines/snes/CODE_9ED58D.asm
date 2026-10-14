; Unidentified routine.
CODE_9ED58D:
	jsl.l vtoa
	lda.b d0
CODE_9ED593:
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #DATA8_9DE528
	jsl.l SetSPAFromA
	lda.w #$00F0
	sta.w $0BEB,x
	rtl
