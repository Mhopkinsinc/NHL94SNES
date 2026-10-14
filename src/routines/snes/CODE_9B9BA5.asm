; Unidentified routine.
CODE_9B9BA5:
	phx
	phy
	lda.w $19BE
	asl a
	asl a
	stz.b $A7
	sta.b d0
	jsl.l CODE_9BB3BE
	lda.b d0
	clc
	adc.w #$0041
	cmp.w #$0080
	bcc .1
	lda.w #$0080
.1:
	sta.b d0
	cmp.w $19C4
	bmi .2
	sta.w $19C4
.2:
	lda.w $19CA
	clc
	adc.b d0
	sta.w $19CA
	bcc .3
	inc.w $19CC
.3:
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
