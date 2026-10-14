; Licence screen: the NHL shield, the NHLPA logo and "Officially licensed product of the National Hockey League" (title sprites 9, 10, 11)
DrawLicenceNHL:
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w DrawTitleSprite
	lda.w #$000A
	jsr.w DrawTitleSprite
	lda.w #$000B
	sta.b $00
	ldx.w #$003C
	ldy.w #$00B0
	lda.w #$2800
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	rts
