; Collision of object X with the corners, the goals and the boards
checkwallcoll:
	lda.w #$012A
	sec
	sbc.w $0D3D
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b d5
	lda.w #$0088
	sec
	sbc.w $0D3B
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b d4
	lda.b d3
	pha
	ldy.b d2
	phy
	dec a
	cmp.b d5
	bpl CODE_9E8D8B
	lda.b d2
	cmp.b d4
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi CODE_9E8DB5
	lda.w #$001A
	sta.b a2
	jsl.l CODE_9E90AE
	jmp.w CODE_9E8E3A
