; Unidentified routine.
CODE_9DB7A0:
	lda.w $0BFB
CODE_9DB7A3:
	dec a
	cmp.w #$0100
	bcc CODE_9DB7B4
	sta.w $0BFB
	ldx.w #$0064
	jsr.w CODE_9DB884
	bra CODE_9DB7A3
