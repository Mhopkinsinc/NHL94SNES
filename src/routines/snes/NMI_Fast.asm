; Unidentified routine.
NMI_Fast:
	rep #$30
	phb
	phk
	plb
	pha
	cli
	lda.w #$0000
	tcd
	lda.w RDNMI
	lda.b $38
	beq CODE_808160
	pla
	plb
	rti
