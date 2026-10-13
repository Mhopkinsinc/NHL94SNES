; Unidentified routine.
CODE_80B62F:
	tax
	lda.b $04
	sta.w $0100,x
	lda.b $06
	sta.w $0102,x
	tya
	sta.w $0104,x
	lda.w $07C8
	lsr a
	and.w #$FF00
	ora.w #$0100
	clc
	adc.b $0A
	sta.w $0106,x
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	sta.b $3C
	plb
	ply
	plx
	lda.w $07BA
	dec a
	asl a
	rtl
