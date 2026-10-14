; Read pad A: d0 = direction, d1 = new presses, d2 = changed buttons, d3 = buttons held
ReadjoyA:
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
