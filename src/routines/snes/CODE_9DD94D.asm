; Unidentified routine.
CODE_9DD94D:
	lda.w #$007E
	sta.b $0E
	lda.w #$3FF4
	sta.b $0C
	ldy.w #DMA_OAM
	ldx.w #$0800
	jsl.l CODE_80891F
	rtl
