; Unidentified routine.
CODE_80BAA9:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BAB6
	jsr.w CODE_80BB97
CODE_80BAB6:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BB11
	jsr.w CODE_80BB97
	bra CODE_80BB11
