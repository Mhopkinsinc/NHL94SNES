; Unidentified routine.
CODE_9B84F5:
	lda.w JoyPad
	sta.b $B1
	lda.w $0AAE
	sta.b $AD
	lda.w $0AB8
	sta.b $A9
	lda.w $0AA4
	sta.b $A5
	rtl
