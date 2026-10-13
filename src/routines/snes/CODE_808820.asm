; Unidentified routine.
CODE_808820:
	txa
	ldx.b $3C
CODE_808823:
	pha
	cmp.w #$1001
	bcc CODE_80882C
	lda.w #$1000
CODE_80882C:
	sta.w $0104,x
	lsr a
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$09
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sec
	sbc.w #$1000
	beq CODE_80885F
	bcs CODE_808823
CODE_80885F:
	stx.b $3C
	rtl
