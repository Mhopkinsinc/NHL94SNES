; Unidentified routine.
CODE_9DD923:
	lda.w #$007E
	sta.b $0E
	lda.w #$37F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0800
	jsl.l CODE_80891F
	rtl
