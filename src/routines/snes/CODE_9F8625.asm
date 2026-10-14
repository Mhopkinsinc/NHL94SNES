; Unidentified routine.
CODE_9F8625:
	jsl.l SpriteFrameStart
	jsl.l CODE_9C9FED
	jsl.l periodicevents
	jsl.l CODE_9F8686
	jsl.l checkwindow
	jsl.l CODE_9BA8DB
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	rtl
