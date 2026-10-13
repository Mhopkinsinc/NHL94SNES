; Unidentified routine.
CODE_80B89A:
	lda.b $16
	sta.w $3032,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $3093,y
	rep #$30
	plb
	ply
	plx
	rtl
