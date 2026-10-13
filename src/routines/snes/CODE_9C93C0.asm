; Unidentified routine.
CODE_9C93C0:
	tax
	phx
	phy
	lda.w #$0092
	sta.b $12
	lda.w #LetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	ply
	plx
	lda.l DATA8_9C93F1,x
	and.w #$00FF
CODE_9C93E5:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C93EC:
	iny
	jmp.w $9375
