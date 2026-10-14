; Unidentified routine.
CODE_9DD938:
	lda.w #$007E
	sta.b $0E
	lda.w #$3834
	sta.b $0C
	ldy.w #$0020
	ldx.w #$0300
	jsl.l DMAToVRAM
	rtl
