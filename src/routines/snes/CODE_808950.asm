; Unidentified routine.
CODE_808950:
	txa
	ldx.b $3C
CODE_808953:
	sta.b $14
	cmp.w #$1000
	bcc CODE_80895D
	lda.w #$1000
CODE_80895D:
	sta.w $0104,x
	lsr a
	sta.b $16
	tya
	sta.w $0106,x
	clc
	adc.b $16
	tay
	lda.b $0C
	sta.w $0101,x
	clc
	adc.b $16
	adc.b $16
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$01
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	lda.b $14
	sec
	sbc.w #$1000
	beq CODE_808998
	bcs CODE_808953
CODE_808998:
	stx.b $3C
	rtl
