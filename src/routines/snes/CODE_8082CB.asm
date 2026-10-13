; Unidentified routine.
CODE_8082CB:
	cmp.b #$FB
	beq CODE_808316
	bmi CODE_808313
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1908
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0079
	bcc CODE_80827C
	sbc.w $0104,x
	bcc CODE_80827C
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	lda.b #$01
	sta.w MDMAEN
	jmp.w CODE_8081F1
