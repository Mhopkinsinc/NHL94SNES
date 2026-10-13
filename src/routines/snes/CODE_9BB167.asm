; Unidentified routine.
CODE_9BB167:
	lda.b $99
	cmp.w ReplayBufferPtr
	bne CODE_9BB176
	lda.b $9B
	cmp.w $0D21
	bne CODE_9BB176
	rtl
