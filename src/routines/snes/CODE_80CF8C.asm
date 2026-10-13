; Unidentified routine.
CODE_80CF8C:
	lda.w $0D47
	inc a
	cmp.w #$0010
	bpl CODE_80CF48
	sta.w $0D47
	jsl.l CODE_80D004
	bra CODE_80CF48
