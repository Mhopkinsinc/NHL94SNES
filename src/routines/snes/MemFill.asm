; Fill X bytes at [p1] with the word A
MemFill:
	txy
	dey
	dey
.loop:
	sta.b [p1],y
	dey
	dey
	bne .loop
	sta.b [p1]
	rtl

.t1:
	sta.b r3
	txy
	dey
	dey
.loopx:
	lda.b [p1],y
	clc
	adc.b r3
	sta.b [p1],y
	dey
	dey
	bne .loopx
	lda.b [p1]
	clc
	adc.b r3
	sta.b [p1]
	rtl
