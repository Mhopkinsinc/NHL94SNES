; Unidentified routine.
CODE_80A4E3:
	lda.w APUIO0
	bne CODE_80A4E3
	lda.b $5B
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0C
	sta.w APUIO0
CODE_80A4F5:
	cmp.w APUIO0
	bne CODE_80A4F5
	stz.w APUIO0
CODE_80A4FD:
	lda.w APUIO0
	bne CODE_80A4FD
	rep #$20
	lda.b $60
	sta.w APUIO2
	sep #$20
	sty.w APUIO1
	lda.b #$0B
	sta.w APUIO0
CODE_80A513:
	cmp.w APUIO0
	bne CODE_80A513
	stz.w APUIO0
	rts
