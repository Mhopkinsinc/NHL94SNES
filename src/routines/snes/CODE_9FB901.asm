; Unidentified routine.
CODE_9FB901:
	jsl.l CODE_9FB91A
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l CODE_808723
	rtl
