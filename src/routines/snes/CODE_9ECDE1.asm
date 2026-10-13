; Unidentified routine.
CODE_9ECDE1:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F79B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $91
	bne CODE_9ECE05
	lda.w #$0014
	sta.w printx
CODE_9ECE05:
	rtl
