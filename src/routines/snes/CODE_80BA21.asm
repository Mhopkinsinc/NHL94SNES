; Unidentified routine.
CODE_80BA21:
	lda.b $71
	and.b #$1F
	asl a
	asl a
	adc.b #$04
	cmp.b #$71
	bcs CODE_80BA46
	rep #$20
	and.w #$00FF
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80BA3A:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA3A
	jmp.w CODE_80B8F0
