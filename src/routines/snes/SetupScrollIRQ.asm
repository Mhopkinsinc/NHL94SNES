; Set up the split scroll of a stats screen: the IRQ lines A, X, Y and the first hook
SetupScrollIRQ:
	sta.w $1DED
	stx.w $1DEF
	sty.w $1DF1
	lda.w #$FFFF
	sta.w $1DF3
	sta.w $1DF5
	sta.w $1DF7
	lda.w #$00C4
	sta.w $07D4
	lda.w #IRQ_StatsScroll1
	ldx.w #IRQ_StatsScroll1>>16
	ldy.w $1DED
	jsl.l SetIRQ
	rtl
