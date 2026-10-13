; send the 256 colours of the colour buffer with CODE_808723
CODE_9DE0D4:		; send the 256 colours of the colour buffer with CODE_808723
	lda.w #$007F
	sta.b $0E
	lda.w #$7500
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l CODE_808723
	rtl
