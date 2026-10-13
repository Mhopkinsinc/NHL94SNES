; Unidentified routine.
CODE_9C95EE:
	tax
	phx
	phy
	lda.w #$0095
	sta.b $12
	lda.w #SmallLetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.w #$0004
	cpx.w #$0024
	bne CODE_9C9617
	lda.w #$0002
CODE_9C9617:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C961E:
	iny
	jmp.w $9599
