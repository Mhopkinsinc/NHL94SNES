; Unidentified routine.
CODE_9F935C:
	cmp.w textdirtyhi
	bcc CODE_9F9364
CODE_9F9361:
	sta.w textdirtyhi
CODE_9F9364:
	rtl
