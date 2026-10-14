; Unidentified routine.
randomd0:
	lda.b d0
	jsl.l randoma
	sta.b d0
	rtl
