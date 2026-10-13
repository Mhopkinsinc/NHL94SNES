; Unidentified routine.
CODE_80CFBE:
	lda.w $1D9B
	inc a
	cmp.w #$0009
	bpl CODE_80CFEE
	sta.w $1D9B
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
