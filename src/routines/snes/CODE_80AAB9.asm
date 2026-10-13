; Unidentified routine.
CODE_80AAB9:
	lda.w $090A,y
	sec
	sbc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sta.b $5A
	plx
	lda.w $095A,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.b $5C
	bpl CODE_80AAE3
	rep #$20
	lda.b $5E
	sta.b $43
	bra CODE_80AAEB
