; Title: an empty sprite frame, then TitleWait
TitleBlankSprites:
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #$0023
	jsl.l TitleWait
	rts
