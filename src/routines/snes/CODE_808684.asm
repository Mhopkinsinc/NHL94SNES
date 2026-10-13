; Unidentified routine.
CODE_808684:
	jsl.l WaitFrame
	jsl.l CODE_808507
	jsl.l CODE_80854F
	jsl.l CODE_808569
	sep #$20
	lda.b #$8F
	sta.w $0762
	jsl.l WaitFrame
	stz.w HDMAEN
	rep #$20
	lda.b $3A
	sta.b $3C
	rtl
