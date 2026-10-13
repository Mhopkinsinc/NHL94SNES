; Unidentified routine.
WeightedRandomSelect:
	lda.b $AB
	pha
	lda.b $A9
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$0000
	sta.b $8F
	lda.w #$0CF9
	sta.b $8D
	stz.b $A9
	bra CODE_9D9CF7
