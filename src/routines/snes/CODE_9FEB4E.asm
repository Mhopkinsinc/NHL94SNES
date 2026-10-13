; Unidentified routine.
CODE_9FEB4E:
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w tmgoalie,y
	bpl CODE_9FEB5C
	jmp.w $EC60
