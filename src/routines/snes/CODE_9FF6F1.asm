; Unidentified routine.
CODE_9FF6F1:
	jsl.l SpriteFrameStart
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	lda.w #$0009
	sta.b $B7
	jmp.w CODE_9FF898
