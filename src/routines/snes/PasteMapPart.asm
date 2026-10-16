; Copy part of map [p0] into the map at [p1], column X, row Y, adding A to each entry
PasteMapPart:
	sta.b r7+2
	stx.b r5
	tya
	asl a
	ldx.b r7
	jsl.l Mul16U
	lda.b r5
	asl a
	clc
	adc.b r2
	adc.b p1
	sta.b p1
	ldy.w #$0000
	lda.b [p0],y
	sta.b r5
	tax
	lda.b r6+2
	asl a
	jsl.l Mul16U
	lda.b r6
	asl a
	clc
	adc.b r2
	adc.w #$0006
	adc.b p0
	sta.b p0
.loop:
	ldx.b r4
	ldy.w #$0000
.loop2:
	lda.b [p0],y
	clc
	adc.b r7+2
	sta.b [p1],y
	iny
	iny
	dex
	bne .loop2
	lda.b r7
	asl a
	adc.b p1
	sta.b p1
	lda.b r5
	asl a
	adc.b p0
	sta.b p0
	dec.b r4+2
	bne .loop
	rtl

.t1:
	php
	sep #$20
	dey
.loopx:
	sta.b [p1],y
	dey
	bne .loopx
	sta.b [p1]
	plp
	rtl
