; Unidentified routine.
CODE_9BB3A4:
	sta.b $14
	asl a
	jsl.l CODE_9BB370
	sec
	sbc.b $14
	clc
	rtl
