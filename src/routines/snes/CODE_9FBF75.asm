; Unidentified routine.
CODE_9FBF75:
	lda.w $0CD5
	bmi CODE_9FBF9F
	tay
	asl a
	adc.w #$37F4
	sta.b $0C
	lda.w #$007E
	sta.b $0E
	lda.w $0CD7
	beq CODE_9FBF9F
	sec
	sbc.w $0CD5
	inc a
	asl a
	tax
	jsl.l CODE_80891F
	lda.w #$FFFF
	sta.w $0CD5
	stz.w $0CD7
CODE_9FBF9F:
	rtl
