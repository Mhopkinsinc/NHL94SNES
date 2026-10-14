; Unidentified routine.
CODE_9C9563:
	lda.w #$3C00
	ldx.b a2
	bne CODE_9C956D
	lda.w #$3E00
CODE_9C956D:
	ldx.w $1E17
	ldy.w $1E1B
	jsl.l DrawSprite
	plx
	ply
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C9580:
	clc
	adc.w $1E17
	sta.w $1E17
CODE_9C9587:
	iny
	jmp.w CODE_9C94F8
