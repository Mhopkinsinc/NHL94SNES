; Unidentified routine.
CODE_9C9967:
	sec
	sbc.w #$2600
	asl a
	asl a
	sta.w $093A
	rtl
	sep #$20
	lda.w $0762
	bmi CODE_9C997E
	lda.w $0AD3
	sta.w INIDISP
CODE_9C997E:
	rep #$30
	rtl
