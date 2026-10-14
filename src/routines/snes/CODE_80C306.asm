; Unidentified routine.
CODE_80C306:
	eor.b #$FF
	tax
.loop:
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl .loop
CODE_80C313:
	iny
	lda.w $0000,y
	bmi CODE_80C306
	beq .rts
.loop:
	tax
	iny
	lda.w $0000,y
.loop2:
	sta.w WMDATA
	dex
	bpl .loop2
	iny
	lda.w $0000,y
	bmi CODE_80C306
	bne .loop
.rts:
	rts
