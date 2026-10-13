; Unidentified routine.
CODE_80BACA:
	bmi CODE_80BAEF
CODE_80BACC:
	iny
	lda.w $0000,y
	beq CODE_80BAC9
	sta.w WMDATA
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	bne CODE_80BACA
CODE_80BADF:
	txa
	sta.w WMDATA
CODE_80BAE3:
	iny
	lda.w $0000,y
	tax
	lda.w $0100,x
	beq CODE_80BADF
	bpl CODE_80BACC
CODE_80BAEF:
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi CODE_80BB3F
CODE_80BAF9:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	bmi CODE_80BAA9
CODE_80BB11:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	phx
	lda.w $0500,x
	tax
	lda.w $0100,x
	beq CODE_80BB2C
	jsr.w CODE_80BB97
CODE_80BB2C:
	txa
	sta.w WMDATA
	plx
	lda.w $0600,x
	tax
	lda.w $0100,x
	beq CODE_80BADF
	jsr.w CODE_80BB97
	bra CODE_80BADF
