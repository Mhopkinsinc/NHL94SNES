; Unidentified routine.
CODE_9EF77A:
	lda.w #$0108
	sec
	sbc.w pucky
	bpl CODE_9EF779
CODE_9EF783:
	lda.w #$0001
	tsb.w iflags
	rtl
