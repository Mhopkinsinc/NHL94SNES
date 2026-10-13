; Unidentified routine.
CODE_9EAD4E:
	stx.b $14
	sty.b $16
	stz.b $C5
	stz.b $C7
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl CODE_9EAD81
	lda.w #$0008
	sta.b $C5
	cpy.b $14
	bpl CODE_9EAD8A
CODE_9EAD67:
	rts
