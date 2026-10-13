; Unidentified routine.
CODE_9EB476:
	jsl.l CODE_9EBF11
	lda.w RefCnt
	bmi CODE_9EB482
	jmp.w $B6F6
