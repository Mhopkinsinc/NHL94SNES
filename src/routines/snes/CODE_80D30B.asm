; Unidentified routine.
CODE_80D30B:
	lda.b $A9
	sep #$20
	sta.b [$8D],y
	rep #$20
CODE_80D313:
	ldy.w $1DB9
	lda.b $A5
	sep #$20
	sta.b [$8D],y
	rep #$20
	pla
	sta.b $A9
	rtl
