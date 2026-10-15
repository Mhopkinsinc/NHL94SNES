; Set up an IRQ pair that shifts the BG1 scroll for a band of lines
SetupBandIRQ:
	sta.w irqline1
	stx.w irqline2
	lda.w #$00C4
	sta.w IRQHTime
	lda.w #IRQ_BandStart
	ldx.w #IRQ_BandStart>>16
	ldy.w irqline1
	jsl.l SetIRQ
	rtl
