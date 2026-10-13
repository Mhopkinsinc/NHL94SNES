; Unidentified routine.
CODE_9BB3B0:
	lda.b $A5
	asl a
	jsl.l CODE_9BB370
	sec
	sbc.b $A5
	sta.b $A5
	clc
	rtl
