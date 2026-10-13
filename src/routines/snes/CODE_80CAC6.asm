; Unidentified routine.
CODE_80CAC6:
	lda.w $1DB9
	cmp.w #$0005
	bpl CODE_80CA9A
	inc.w $1DB9
	jsl.l CODE_80CC89
	bra CODE_80CA9A
