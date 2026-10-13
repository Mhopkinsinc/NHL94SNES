; Unidentified routine.
CODE_9B9BA5:
	phx
	phy
	lda.w $19BE
	asl a
	asl a
	stz.b $A7
	sta.b $A5
	jsl.l CODE_9BB3BE
	lda.b $A5
	clc
	adc.w #$0041
	cmp.w #$0080
	bcc CODE_9B9BC2
	lda.w #$0080
CODE_9B9BC2:
	sta.b $A5
	cmp.w $19C4
	bmi CODE_9B9BCC
	sta.w $19C4
CODE_9B9BCC:
	lda.w $19CA
	clc
	adc.b $A5
	sta.w $19CA
	bcc CODE_9B9BDA
	inc.w $19CC
CODE_9B9BDA:
	inc.w $19C8
	lda.w $19CC
	sta.b $0A
	lda.w $19CA
	sta.b $08
	lda.w $19C8
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $19C6
	ply
	plx
	rtl
