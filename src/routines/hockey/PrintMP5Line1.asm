; Print the first MultiPlayer 5 warning line, centered.
PrintMP5Line1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PrintMP5Line1Pos>>16
	sta.b $8F
	lda.w #PrintMP5Line1Pos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra PrintCentered
