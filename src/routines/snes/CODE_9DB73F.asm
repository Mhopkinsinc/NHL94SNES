; Unidentified routine.
CODE_9DB73F:
	pha
	jsl.l SpriteFrameStart
	pla
	jsr.w CODE_9DB754
	jsl.l SpriteFrameEnd
	ldx.w #$0004
	jsl.l CODE_9DBCEB
	rts
