; Unidentified routine.
CODE_9FC86B:
	jsl.l CODE_9F9EB7
CODE_9FC86F:
	dec.b d0
	bpl CODE_9FC86B
CODE_9FC873:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9FC845
CODE_9FC87B:
	rtl
