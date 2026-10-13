; Unidentified routine.
CODE_9D93E3:
	txa
	asl a
	asl a
	asl a
	asl a
	pha
	sep #$20
	txa
	lsr a
	sta.l $7F7500,x
	inc a
	sta.l $7F7502,x
	tya
	lsr a
	lsr a
	lsr a
	and.b #$1C
	clc
	adc.b #$30
	cpx.w #$0200
	bcc CODE_9D9406
	ora.b #$01
CODE_9D9406:
	sta.l $7F7501,x
	sta.l $7F7503,x
	lda.b $01,s
	tax
	tya
	lsr a
	and.b #$0F
	sta.b $00
	jsr.w $942A
	rep #$20
	pla
	clc
	adc.w #$0020
	tax
	sep #$20
	jsr.w $9494
	rep #$20
	rts
