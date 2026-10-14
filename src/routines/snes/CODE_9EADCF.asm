; Unidentified routine.
CODE_9EADCF:
	ldx.w #$0102
	ldy.w #$011C
	jsr.w CODE_9EAF34
	ldx.w #$0101
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.b $C9
	bne CODE_9EAE01
	ldx.w #$FEE4
	ldy.w #$FEFE
	jsr.w CODE_9EAF34
	ldx.w #$FEE3
	ldy.w #$FEFF
	stx.b $14
	sty.b $16
	lda.b $C9
	bne CODE_9EAE31
	ldx.b $E4
	plb
	rtl
