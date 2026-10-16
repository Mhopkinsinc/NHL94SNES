; d1 = the buttons that changed on any pad
ReadAnyPad:
	lda.w padchangeany
	sta.b d1
	rtl
