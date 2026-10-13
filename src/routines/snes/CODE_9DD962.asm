; Unidentified routine.
CODE_9DD962:
	lda.w #$007E
	sta.b $0E
	lda.w #$4034
	sta.b $0C
	ldy.w #$0420
	ldx.w #$0300
	jsl.l CODE_80891F
	rtl
