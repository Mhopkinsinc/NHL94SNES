; A = a random number from 0 to A-1, for A below 256
randoma8:
	phx
	pha
CODE_9BB387:
	jsl.l RandomWord
	and.w #$00FF
	tax
	pla
	jsl.l CODE_808F4C
	plx
	xba
	and.w #$00FF
	clc
	rtl
