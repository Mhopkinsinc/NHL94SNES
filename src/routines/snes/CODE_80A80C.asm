; Unidentified routine.
CODE_80A80C:
	lda.b $60
	sec
	sbc.w $089D,y
	asl a
	tax
	rep #$20
	lda.b $5A
	sec
	sbc.l PitchTable,x
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.w $088C,y
	bpl CODE_80A831
	rep #$20
	lda.b $5E
	sta.b $43
	bra CODE_80A839
