; Unidentified routine.
CODE_9C953D:
	and.w #$00DF
	sec
	sbc.w #$0041
	tax
CODE_9C9545:
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	phy
	phx
	txa
	clc
	adc.w #$03A0
	sta.b $00
	lda.l $7E3462
	bne CODE_9C9563
	lda.w #$3800
	bra CODE_9C956D
