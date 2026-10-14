; Unidentified routine.
CODE_9DB891:
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #$0023
	jsl.l TitleWait
	rts
