; Unidentified routine.
CODE_9FC86B:
	jsl.l CODE_9F9EB7
CODE_9FC86F:
	dec.b $A5
	bpl CODE_9FC86B
CODE_9FC873:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9FC845
CODE_9FC87B:
	rtl
