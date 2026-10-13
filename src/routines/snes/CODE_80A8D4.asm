; Unidentified routine.
CODE_80A8D4:
	lda.w $086A,x
	sta.b $4E
	sep #$20
	lda.w $07E3
	bne CODE_80A8EC
	ldy.b #$12
	lda.b ($4E),y
	sta.w $07FB
	iny
	lda.b ($4E),y
	bra CODE_80A8F3
