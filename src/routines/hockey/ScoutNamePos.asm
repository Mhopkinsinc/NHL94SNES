; Where the name of a player shown on the scouting report is printed
ScoutNamePos:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #ScoutNamePosAt>>16
	sta.b a1+2
	lda.w #ScoutNamePosAt+5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.b a2
	bne .rtl
	lda.w #$0014
	sta.w printx
.rtl:
	rtl
