; Unidentified routine.
CODE_80D30B:
	lda.b d1
	sep #$20
	sta.b [a1],y
	rep #$20
CODE_80D313:
	ldy.w $1DB9
	lda.b d0
	sep #$20
	sta.b [a1],y
	rep #$20
	pla
	sta.b d1
	rtl
