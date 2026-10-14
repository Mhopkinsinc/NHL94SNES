; Run one frame of game logic
DoGameFrame:
	jsl.l SpriteFrameStart
	jsl.l CODE_9C9FED
	jsl.l periodicevents
	jsl.l updateplayers
	jsl.l checkwindow
	jsl.l updatereplay
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	rtl
