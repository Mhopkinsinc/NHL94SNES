; Where the name of a player shown on the scouting report is printed
ScoutNamePos:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ScoutNamePosAt>>16
	sta.b $8F
	lda.w #ScoutNamePosAt+5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b a2
	bne .rtl
	lda.w #$0014
	sta.w printx
.rtl:
	rtl
