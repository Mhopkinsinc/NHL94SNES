; Unidentified routine.
CODE_9DB90A:
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
