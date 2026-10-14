; Unidentified routine.
CODE_9B84DC:
	phx
	asl a
	tax
	lda.w JoyPad,x
	sta.b d3
	lda.w $0AAE,x
	sta.b d2
	lda.w $0AB8,x
	sta.b d1
	lda.w $0AA4,x
	sta.b d0
	plx
	rtl
