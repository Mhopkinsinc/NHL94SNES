; Unidentified routine.
CODE_9DA966:
	inc a
	cmp.w #$0005
	bcc CODE_9DA95E
	lda.w #$0001
	sta.b d3
	bra CODE_9DA95E
