; Unidentified routine.
CODE_9EAB93:
	ldx.w #$00E5
	ldy.w #$011C
	jsr.w $AD4E
	ldx.w #$00E4
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.w #$0108
	sta.b $22
	lda.w $0B9D
	sta.b $20
	lda.b $C9
	bne CODE_9EABD9
	ldx.w #$FEE4
	ldy.w #$FF1B
	jsr.w $AD4E
	ldx.w #$FEE3
	ldy.w #$FF1C
	stx.b $14
	sty.b $16
	lda.w #$FEF8
	sta.b $22
	lda.w $0B9F
	sta.b $20
	lda.b $C9
	bne CODE_9EAC09
	ldx.b $E4
	plb
	rtl
