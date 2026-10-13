; Unidentified routine.
CODE_80BB97:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BBA4
	jsr.w CODE_80BB97
CODE_80BBA4:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	bne CODE_80BB97
	rts
