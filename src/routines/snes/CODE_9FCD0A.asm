; Unidentified routine.
CODE_9FCD0A:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD15
	ldy.w #$000C
CODE_9FCD15:
	lda.w $19D4,y
	bpl CODE_9FCD1F
	lda.w position,y
	bpl CODE_9FCD23
CODE_9FCD1F:
	iny
	iny
	bra CODE_9FCD15
