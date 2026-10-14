; Unidentified routine.
CODE_9FAB97:
	lda.w #$EA1A
CODE_9FAB9A:
	jsl.l CODE_9EA3F1
	jsl.l CODE_9EA419
CODE_9FABA2:
	inc.b a3
	inc.b a3
	pla
	sta.b d2
	dec.b d2
	lda.b d2
	pha
	bmi CODE_9FABB3
	jmp.w CODE_9FA9EF
