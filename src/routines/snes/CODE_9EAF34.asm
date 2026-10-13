; Unidentified routine.
CODE_9EAF34:
	stx.b $14
	sty.b $16
	stz.b $C5
	stz.b $C7
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl CODE_9EAF67
	lda.w #$0008
	sta.b $C5
	cpy.b $14
	bpl CODE_9EAF70
CODE_9EAF4D:
	rts
