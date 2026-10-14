; Unidentified routine.
CODE_9DC3DB:
	jsl.l CODE_9DC561
	lda.b d0
	dec a
	cmp.w $1E7B
	bpl CODE_9DC3F3
	cmp.w $1E7F
	bpl CODE_9DC40F
	cmp.w $1E83
	bpl CODE_9DC42B
	bra CODE_9DC435
