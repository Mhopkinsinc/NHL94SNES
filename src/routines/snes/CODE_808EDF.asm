; Unidentified routine.
CODE_808EDF:
	txy
	dey
	dey
.loop:
	sta.b [$10],y
	dey
	dey
	bne .loop
	sta.b [$10]
	rtl

.t1:
	sta.b $14
	txy
	dey
	dey
.loopx:
	lda.b [$10],y
	clc
	adc.b $14
	sta.b [$10],y
	dey
	dey
	bne .loopx
	lda.b [$10]
	clc
	adc.b $14
	sta.b [$10]
	rtl
