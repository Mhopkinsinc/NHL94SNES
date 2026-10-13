; Unidentified routine.
CODE_9B9562:
	lda.w $1DC1
	cmp.w #$0000
	beq CODE_9B9591
CODE_9B956A:
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
	ldy.w #$0160
	jsl.l CODE_80891F
	rts
