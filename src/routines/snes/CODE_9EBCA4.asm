; Unidentified routine.
CODE_9EBCA4:
	jsl.l checkagr
	lda.b d0
	cmp.w #$0005
	bcs CODE_9EBCB8
	lda.w #$0022
	sta.b d0
	jsl.l AddPenalty
CODE_9EBCB8:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w $0CDB
	rtl
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9EBCD2
	jmp.w CODE_9EBD1D
