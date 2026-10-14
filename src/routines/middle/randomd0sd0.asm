; randomd0s with the range in d0
randomd0sd0:
	lda.b d0
	asl a
	jsl.l CODE_9BB370
	sec
	sbc.b d0
	sta.b d0
	clc
	rtl
