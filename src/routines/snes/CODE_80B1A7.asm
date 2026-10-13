; Unidentified routine.
CODE_80B1A7:
	lda.w SpritesLeft
	beq CODE_80B1A5
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	sta.w $07CC
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w $07CE
	iny
	sty.w $07D0
	lda.w $07CA
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi CODE_80B1DD
	cmp.w #$00E0
	bmi CODE_80B1E0
CODE_80B1DD:
	jmp.w CODE_80B27A
