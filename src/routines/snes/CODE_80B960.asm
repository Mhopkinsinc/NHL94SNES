; Unidentified routine.
CODE_80B960:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b [$0C],y
	iny
	sta.b $75
	rep #$20
	lda.b $73
	asl a
	asl a
	xba
	and.w #$0003
	beq CODE_80B987
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80B97E:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B97E
CODE_80B987:
	rep #$20
	lda.b $73
	and.w #$003F
	xba
	clc
	adc.b $75
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$003F
	clc
	adc.w #$0004
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
CODE_80B9B1:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80B9B1
	ldy.b $79
	jmp.w CODE_80B8F0
