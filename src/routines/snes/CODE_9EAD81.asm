; Unidentified routine.
CODE_9EAD81:
	cpy.b $14
	bpl CODE_9EAD8A
	lda.w #$0008
	sta.b $C7
CODE_9EAD8A:
	cpx.b $16
	bmi CODE_9EAD68
	lda.w #$0002
	sta.b $C5
	cpy.b $16
	bpl CODE_9EAD67
CODE_9EAD97:
	ldx.b $0C
	ldy.b $10
	cpx.w #$002C
	bmi CODE_9EAD73
	lda.b $C5
	ora.w #$0004
	sta.b $C5
	cpy.w #$002C
	bpl CODE_9EAD67
CODE_9EADAC:
	cpx.w #$FFD4
	bpl CODE_9EADC0
	lda.b $C5
	ora.w #$0010
	sta.b $C5
	cpy.w #$FFD4
	bmi CODE_9EAD67
CODE_9EADBD:
	inc.b $C9
	rts
