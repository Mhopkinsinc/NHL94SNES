; A = a random number from 0 to A-1
randoma:
	phx
	pha
	cmp.w #$0100
	bcc CODE_9BB387
	jsl.l RandomWord
	plx
	jsl.l Mul16U
	plx
	lda.b $0A
	clc
	rtl
