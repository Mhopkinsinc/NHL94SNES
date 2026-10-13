; Unidentified routine.
CODE_80B8FC:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b $71
	rep #$20
	and.w #$0003
	beq CODE_80B91B
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80B912:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B912
CODE_80B91B:
	rep #$20
	lda.b $71
	and.w #$0060
	asl a
	asl a
	asl a
	clc
	adc.b $73
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$001C
	lsr a
	lsr a
	clc
	adc.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	sty.b $79
	ldy.w #$0000
	sep #$20
CODE_80B949:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B949
	ldy.b $79
	jmp.w CODE_80B8F0
