; Unidentified routine.
CODE_80B511:
	lda.b $0A
	ora.w #$0100
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
