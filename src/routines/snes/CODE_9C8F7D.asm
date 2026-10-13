; Unidentified routine.
CODE_9C8F7D:
	lda.w $1DBD
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w $1DC5
	inc a
	xba
	lsr a
	tax
	ldy.w #$0180
	jsl.l CODE_80891F
	rts
