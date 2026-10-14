; Unidentified routine.
CODE_9EAF34:
	stx.b $14
	sty.b $16
	stz.b tmp0
	stz.b tmp1
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl CODE_9EAF67
	lda.w #$0008
	sta.b tmp0
	cpy.b $14
	bpl CODE_9EAF70
CODE_9EAF4D:
	rts
