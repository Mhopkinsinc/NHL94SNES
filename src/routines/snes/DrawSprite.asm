; Unidentified routine.
DrawSprite:		; draw frame $00 of the sprite set at [$10] at X, Y; A is xored into the tile and attribute word
		;   of each piece, and its flip bits also mirror the piece positions
	sta.b $14
	stx.b $1C
	sty.b $1E
	phb
	pea.w $7E7E
	plb
	plb
	lda.b $00
	sta.w $07C4
	asl a
	asl a
	tay
	lda.b [$10],y
	clc
	adc.b $10
	sta.b $0C
	iny
	iny
	lda.b [$10],y
	adc.b $12
	sta.b $0E
CODE_80B0B0:
	jsr.w CODE_80B01E
	bmi CODE_80B0C6
	sta.b $16
	ldx.w OAMNext
	ldy.w #$0000
	lda.b [$0C],y
	and.w #$00FF
	sta.b $00
	bra CODE_80B0C8
