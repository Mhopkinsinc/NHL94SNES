; Unidentified routine.
CODE_9DB9B4:
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w CODE_9DB754
	lda.w #$000A
	jsr.w CODE_9DB754
	lda.w #$000B
	sta.b $00
	ldx.w #$003C
	ldy.w #$00A0
	lda.w #$2800
	jsl.l DrawSprite
	lda.w #$000C
	sta.b $00
	ldx.w #$003C
	ldy.w #$00D0
	lda.w #$2800
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	rts
