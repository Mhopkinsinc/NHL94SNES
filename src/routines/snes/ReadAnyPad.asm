; d1 = the buttons that changed on any pad
ReadAnyPad:
	lda.w $0AC2
	sta.b d1
	rtl
