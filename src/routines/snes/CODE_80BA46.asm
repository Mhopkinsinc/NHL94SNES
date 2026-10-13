; Unidentified routine.
CODE_80BA46:
	lda.b $71
	rep #$20
	and.w #$0003
	beq CODE_80BA60
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
CODE_80BA57:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne CODE_80BA57
CODE_80BA60:
	rep #$20
	rts
