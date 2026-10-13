; Unidentified routine.
CODE_9DC27C:
	jsl.l CODE_9DD94D
CODE_9DC280:
	jsl.l CODE_9DC2DE
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	rtl
