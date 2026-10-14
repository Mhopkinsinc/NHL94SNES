; Unidentified routine.
CODE_9B84F5:
	lda.w JoyPad
	sta.b d3
	lda.w $0AAE
	sta.b d2
	lda.w $0AB8
	sta.b d1
	lda.w $0AA4
	sta.b d0
	rtl
