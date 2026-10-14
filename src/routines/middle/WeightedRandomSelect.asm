; Unidentified routine.
WeightedRandomSelect:
	lda.b $AB
	pha
	lda.b d1
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$0000
	sta.b $8F
	lda.w #$0CF9
	sta.b a1
	stz.b d1
	bra CODE_9D9CF7
