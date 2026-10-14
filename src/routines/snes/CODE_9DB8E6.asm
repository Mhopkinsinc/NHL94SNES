; Unidentified routine.
CODE_9DB8E6:
	phx
	phy
	cmp.w #$0480
	bcc .t1
	sec
	sbc.w #$0480
	tax
	lda.w #$00C6
	jsl.l CODE_808F98
	lda.w #$0080
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0066
	bra CODE_9DB931

.t1:
	pha
	tax
	lda.w #$000A
	jsl.l CODE_808F98
	lda.w #$0050
	sta.b $04
	jsl.l Div16U
	lda.b $00
	clc
	adc.w #$0001
	tax
	pla
	phx
	jsl.l Sin
	tax
	pla
	jsl.l CODE_808FC9
	lda.b $09
CODE_9DB931:
	ply
	plx
	rts
