; Unidentified routine.
CODE_9DB7BB:
	lda.w $0BFB
CODE_9DB7BE:
	inc a
	cmp.w #$0200
	bcs CODE_9DB7CF
	sta.w $0BFB
	ldx.w #$0200
	jsr.w $B884
	bra CODE_9DB7BE
