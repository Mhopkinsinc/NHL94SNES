; Where the name of a player shown on the scouting report is printed
ScoutNamePos:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F79B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b a2
	bne CODE_9ECE05
	lda.w #$0014
	sta.w printx
CODE_9ECE05:
	rtl
