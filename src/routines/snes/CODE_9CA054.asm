; Unidentified routine.
CODE_9CA054:
	lda.w $0C29
	bmi CODE_9CA0B1
	lda.w sfhormode
	bne CODE_9CA0B1
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w $0C29
	lsr a
	lsr a
	lsr a
	tax
	lda.w $0C29
	and.w #$0007
	clc
	adc.l DATA8_9CA099-2,x
	sta.b $00
	lda.w Vpos
	sec
	sbc.l DATA8_9CA0A1-2,x
	tay
	lda.l DATA8_9CA0A9-2,x
	pha
	lda.w #$FFE2
	sec
	sbc.w Hpos
	tax
	pla
	jsl.l DrawSprite
	bra CODE_9CA0B1
