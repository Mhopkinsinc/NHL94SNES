; Unidentified routine.
CODE_80BB97:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq .1
	jsr.w CODE_80BB97
.1:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	bne CODE_80BB97
	rts
