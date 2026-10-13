; Unidentified routine.
CODE_9BB370:
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
