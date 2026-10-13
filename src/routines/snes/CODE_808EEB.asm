; Unidentified routine.
CODE_808EEB:
	sta.b $14
	txy
	dey
	dey
CODE_808EF0:
	lda.b [$10],y
	clc
	adc.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808EF0
	lda.b [$10]
	clc
	adc.b $14
	sta.b [$10]
	rtl
