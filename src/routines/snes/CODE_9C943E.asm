; Unidentified routine.
CODE_9C943E:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	stz.b $16
	lda.b d1
	pha
	bmi CODE_9C945C
	asl a
	tay
	lda.w $9649,y
	sta.b d1
	ldy.w #$0000
	bra CODE_9C9479
