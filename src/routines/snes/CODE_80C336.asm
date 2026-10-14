; Unidentified routine.
CODE_80C336:
	eor.b #$FF
	tax
.loop:
	iny
	lda.w $0000,y
	sta.w WMDATA
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl .loop
CODE_80C34A:
	iny
	lda.w $0000,y
	bmi CODE_80C336
	beq .rts
.loop:
	tax
	iny
	lda.w $0000,y
	xba
	iny
	lda.w $0000,y
.loop2:
	xba
	sta.w WMDATA
	xba
	sta.w WMDATA
	dex
	bpl .loop2
	lda.b #$00
	xba
	iny
	lda.w $0000,y
	bmi CODE_80C336
	bne .loop
.rts:
	rts
