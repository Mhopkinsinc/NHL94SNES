; Unidentified routine.
CODE_80C306:
	eor.b #$FF
	tax
CODE_80C309:
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl CODE_80C309
CODE_80C313:
	iny
	lda.w $0000,y
	bmi CODE_80C306
	beq CODE_80C32E
CODE_80C31B:
	tax
	iny
	lda.w $0000,y
CODE_80C320:
	sta.w WMDATA
	dex
	bpl CODE_80C320
	iny
	lda.w $0000,y
	bmi CODE_80C306
	bne CODE_80C31B
CODE_80C32E:
	rts
