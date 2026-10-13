; Unidentified routine.
CODE_9DBBA8:
	phx
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	inc a
	tax
	phx
	ldx.w #$0000
	lda.w #$0000
CODE_9DBBB8:
	sta.l $7FA000,x
	inx
	inx
	cpx.w #$0040
	bcc CODE_9DBBB8
	plx
	stz.w $0BE5
	lda.w #$0040
	sta.w $0BE7
CODE_9DBBCD:
	phx
	jsr.w $BBF1
	lda.w $0BE5
	clc
	adc.w #$0020
	sta.w $0BE5
	lda.w $0BE7
	clc
	adc.w #$0040
	sta.w $0BE7
	plx
	dex
	bne CODE_9DBBCD
	pla
	asl a
	clc
	adc.w #$0040
	tax
	rts
