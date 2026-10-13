; Unidentified routine.
CODE_8089C7:
	txa
	ldx.b $3C
CODE_8089CA:
	sta.b $14
	cmp.w #$1001
	bcc CODE_8089D4
	lda.w #$1000
CODE_8089D4:
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.b $0C
	sta.w $0101,x
	clc
	adc.w #$1000
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FA
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
	beq CODE_808A0E
	bcs CODE_8089CA
CODE_808A0E:
	stx.b $3C
	rtl
