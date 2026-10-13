; Unidentified routine.
CODE_9FAB97:
	lda.w #SPAglide
CODE_9FAB9A:
	jsl.l CODE_9EA3F1
	jsl.l updateanim
CODE_9FABA2:
	inc.b $95
	inc.b $95
	pla
	sta.b $AD
	dec.b $AD
	lda.b $AD
	pha
	bmi CODE_9FABB3
	jmp.w $A9EF
