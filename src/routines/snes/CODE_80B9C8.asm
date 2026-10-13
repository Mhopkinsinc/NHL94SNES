; Unidentified routine.
CODE_80B9C8:
	lda.b $71
	rep #$20
	and.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	lda.b [$0C],y
	xba
	sta.b $7B
	iny
	iny
	sep #$20
	lda.b [$0C],y
	iny
	sta.b $77
	txa
	beq CODE_80B9EF
CODE_80B9E6:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B9E6
CODE_80B9EF:
	rep #$20
	clc
	lda.b $6F
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$000C
	lsr a
	lsr a
	xba
	clc
	adc.b $77
	adc.w #$0005
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
CODE_80BA13:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA13
	ldy.b $79
	jmp.w CODE_80B8F0
