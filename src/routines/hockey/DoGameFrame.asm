; Run one frame of game logic
DoGameFrame:
	jsl.l SpriteFrameStart
	jsl.l CODE_9C9FED
	jsl.l periodicevents
	jsl.l updateplayers
	jsl.l checkwindow
	jsl.l updatereplay
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	rtl
