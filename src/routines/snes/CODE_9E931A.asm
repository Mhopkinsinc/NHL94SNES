; Unidentified routine.
CODE_9E931A:
	lda.b d3
	clc
	adc.w $0D3D
	cmp.w #$00EA
	bmi CODE_9E9305
CODE_9E9325:
	lda.b d2
	bit.w #$8000
	beq CODE_9E9330
	eor.w #$FFFF
	inc a
CODE_9E9330:
	sec
	sbc.w $0D3B
	cmp.w #$0040
	bpl CODE_9E9305
	lda.b d3
	pha
	sec
	sbc.w Ypos,y
	sta.b d3
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d2
	pha
	sec
	sbc.w Xpos,y
	sta.b d1
	sta.b $04
	tax
	jsl.l CODE_808F7D
	sta.b $08
	ldx.b a3
	lsr a
	lsr a
	cmp.w #$0101
	bcs CODE_9E9379
	sta.b d2
	lda.b d3
	sta.b $06
	tax
	jsl.l CODE_808F7D
	asl a
	sta.b $0A
	ldx.b a3
	clc
	adc.b d2
	cmp.w #$0101
CODE_9E9379:
	bcs CODE_9E93D9
	pla
	sta.b d2
	pla
	sta.b d3
	jsr.w CODE_9E93E0
	lda.b d3
	pha
	lda.b d2
	pha
	lda.b $04
	ldy.b $06
	jsl.l CODE_9CA554
	inc a
	sta.b d2
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi CODE_9E93AA
	lda.w #$00FF
CODE_9E93AA:
	cmp.w #$FF01
	bpl CODE_9E93B2
	lda.w #$FF01
CODE_9E93B2:
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi CODE_9E93C9
	lda.w #$00FF
CODE_9E93C9:
	cmp.w #$FF01
	bpl CODE_9E93D1
	lda.w #$FF01
CODE_9E93D1:
	sta.b d1
	ldx.b a3
	jsl.l CODE_9E8F42
CODE_9E93D9:
	pla
	sta.b d2
	pla
	sta.b d3
	rtl
