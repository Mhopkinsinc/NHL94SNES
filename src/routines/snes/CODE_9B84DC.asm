; Unidentified routine.
CODE_9B84DC:
	phx
	asl a
	tax
	lda.w JoyPad,x
	sta.b $B1
	lda.w $0AAE,x
	sta.b $AD
	lda.w $0AB8,x
	sta.b $A9
	lda.w $0AA4,x
	sta.b $A5
	plx
	rtl
