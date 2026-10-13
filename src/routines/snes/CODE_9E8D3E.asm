; Unidentified routine.
CODE_9E8D3E:
	lda.w #$012A
	sec
	sbc.w $0D3D
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b $B9
	lda.w #$0088
	sec
	sbc.w $0D3B
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b $B5
	lda.b $B1
	pha
	ldy.b $AD
	phy
	dec a
	cmp.b $B9
	bpl CODE_9E8D8B
	lda.b $AD
	cmp.b $B5
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	cmp.b $AD
	bmi CODE_9E8DB5
	lda.w #$001A
	sta.b $91
	jsl.l CODE_9E90AE
	jmp.w $8E3A
