; Set up an IRQ pair that shifts the BG1 scroll for a band of lines
SetupBandIRQ:
	sta.w $1DED
	stx.w $1DEF
	lda.w #$00C4
	sta.w IRQHTime
	lda.w #IRQ_BandStart
	ldx.w #IRQ_BandStart>>16
	ldy.w $1DED
	jsl.l SetIRQ
	rtl
