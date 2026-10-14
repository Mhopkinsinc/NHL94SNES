; A = a random number from -A to A-1
randomd0s:
	sta.b $14
	asl a
	jsl.l randoma
	sec
	sbc.b $14
	clc
	rtl
