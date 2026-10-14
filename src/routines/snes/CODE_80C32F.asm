; Unidentified routine.
CODE_80C32F:
	lda.w #$0000
	sep #$20
	bra .2
.1:
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
.2:
	iny
	lda.w $0000,y
	bmi .1
	beq .rts
.loopx:
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
	bmi .1
	bne .loopx
.rts:
	rts
