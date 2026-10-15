; Set up the split scroll of a stats screen: the IRQ lines A, X, Y and the first hook
SetupScrollIRQ:
	sta.w irqline1
	stx.w irqline2
	sty.w irqline3
	lda.w #$FFFF
	sta.w irqvscroll1
	sta.w irqvscroll2
	sta.w irqvscroll3
	lda.w #$00C4
	sta.w IRQHTime
	lda.w #IRQ_StatsScroll1
	ldx.w #IRQ_StatsScroll1>>16
	ldy.w irqline1
	jsl.l SetIRQ
	rtl
