; Unidentified routine.
CODE_9C874C:
	jsl.l CODE_9C8858
	lda.w $1DB9
	dec a
	cmp.w $1DBD
	bpl CODE_9C875C
	jmp.w CODE_808684
