; Unidentified routine.
CODE_8088BA:
	txa
	ldx.b $3C
CODE_8088BD:
	pha
	cmp.w #$1001
	bcc CODE_8088C6
	lda.w #$1000
CODE_8088C6:
	pha
	sta.w $0104,x
	tya
	sta.w $0106,x
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FD
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0017
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FC
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
	beq CODE_80891C
	bcs CODE_8088BD
CODE_80891C:
	stx.b $3C
	rtl
