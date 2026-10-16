; A = a random number from 0 to A-1, for A below 256
randoma8:
	phx
	pha
randoma8_go:
	jsl.l RandomWord
	and.w #$00FF
	tax
	pla
	jsl.l Mul8U
	plx
	xba
	and.w #$00FF
	clc
	rtl
