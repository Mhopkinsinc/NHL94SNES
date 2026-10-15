; OR the word A into X bytes at [p1]
MemOr:
	sta.b r3
	txy
	dey
	dey
.loop:
	lda.b [p1],y
	ora.b r3
	sta.b [p1],y
	dey
	dey
	bne .loop
	lda.b [p1]
	ora.b r3
	sta.b [p1]
	rtl

.t1:
	sta.b r3
	txy
	dey
	dey
.loopx:
	lda.b [p1],y
	and.b r3
	sta.b [p1],y
	dey
	dey
	bne .loopx
	lda.b [p1]
	and.b r3
	sta.b [p1]
	rtl
