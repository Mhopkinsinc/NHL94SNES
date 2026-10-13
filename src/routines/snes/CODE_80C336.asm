; Unidentified routine.
CODE_80C336:
	eor.b #$FF
	tax
CODE_80C339:
	iny
	lda.w $0000,y
	sta.w WMDATA
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl CODE_80C339
CODE_80C34A:
	iny
	lda.w $0000,y
	bmi CODE_80C336
	beq CODE_80C372
CODE_80C352:
	tax
	iny
	lda.w $0000,y
	xba
	iny
	lda.w $0000,y
CODE_80C35C:
	xba
	sta.w WMDATA
	xba
	sta.w WMDATA
	dex
	bpl CODE_80C35C
	lda.b #$00
	xba
	iny
	lda.w $0000,y
	bmi CODE_80C336
	bne CODE_80C352
CODE_80C372:
	rts
