; Unidentified routine.
CODE_9C9ABC:
	pha
	lda.w puckvx
	cmp.w #$8000
	ror a
	sta.b $0C
	lda.w puckvy
	cmp.w #$8000
	ror a
	sta.b $0E
	pla
CODE_9C9AD0:
	phx
	sta.b $12
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $0D
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9C9AE9
	ora.w #$FF00
CODE_9C9AE9:
	tax
	jsl.l CODE_808F7D
	sta.b $64
	lda.b $0F
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9C9AFD
	ora.w #$FF00
CODE_9C9AFD:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $64
	lsr a
	lsr a
	lsr a
	sta.b $64
	cmp.w #$0070
	bcs CODE_9C9B14
	xba
	sta.b $64
	bra CODE_9C9B19
