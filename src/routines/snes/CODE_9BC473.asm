; Unidentified routine.
CODE_9BC473:
	lda.w $1DBD
	asl a
	adc.w $1DBD
	xba
	lsr a
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w $1DC5
	asl a
	adc.w $1DC5
	xba
	lsr a
	lsr a
	tax
	ldy.w #$0140
	jsl.l CODE_80891F
CODE_9BC499:
	rtl
