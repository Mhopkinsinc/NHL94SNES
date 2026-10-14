; Unidentified routine.
DecompressRLE:		; run-length data at Y to WRAM: literal runs and repeats, of bytes if its header word is $0101,
		;   else of byte pairs
	iny
	iny
	iny
	lda.w $0000,y
	iny
	cmp.w #$0101
	bne .3
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
.loop2:
	sta.w WMDATA
	dex
	bpl .loop2
	iny
	lda.w $0000,y
	bmi .1
	bne .loopx
.rts:
	rts
.3:
	lda.w #$0000
	sep #$20
	bra .2x
.1x:
	eor.b #$FF
	tax
.loopxx:
	iny
	lda.w $0000,y
	sta.w WMDATA
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl .loopxx
.2x:
	iny
	lda.w $0000,y
	bmi .1x
	beq .rtsx
.loopxxx:
	tax
	iny
	lda.w $0000,y
	xba
	iny
	lda.w $0000,y
.loop2x:
	xba
	sta.w WMDATA
	xba
	sta.w WMDATA
	dex
	bpl .loop2x
	lda.b #$00
	xba
	iny
	lda.w $0000,y
	bmi .1x
	bne .loopxxx
.rtsx:
	rts
