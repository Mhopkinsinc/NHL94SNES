; Print the fourth MultiPlayer 5 warning line, centered.
PrintMP5Line4:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF940
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra PrintCentered
