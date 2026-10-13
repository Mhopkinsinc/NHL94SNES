; Unidentified routine.
CODE_9FA458:
	lda.w gameclock
	cmp.w #$01E1
	bcc CODE_9FA461
	rtl
