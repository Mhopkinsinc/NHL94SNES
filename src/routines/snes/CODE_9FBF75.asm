; Unidentified routine.
CODE_9FBF75:
	lda.w textdirtylo
	bmi .rtl
	tay
	asl a
	adc.w #$37F4
	sta.b $0C
	lda.w #$007E
	sta.b $0E
	lda.w textdirtyhi
	beq .rtl
	sec
	sbc.w textdirtylo
	inc a
	asl a
	tax
	jsl.l CODE_80891F
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
.rtl:
	rtl
