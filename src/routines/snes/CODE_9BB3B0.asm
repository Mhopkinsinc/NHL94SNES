; Unidentified routine.
CODE_9BB3B0:
	lda.b d0
	asl a
	jsl.l CODE_9BB370
	sec
	sbc.b d0
	sta.b d0
	clc
	rtl
