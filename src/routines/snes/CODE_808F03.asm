; Unidentified routine.
CODE_808F03:
	sta.b $14
	txy
	dey
	dey
.loop:
	lda.b [$10],y
	ora.b $14
	sta.b [$10],y
	dey
	dey
	bne .loop
	lda.b [$10]
	ora.b $14
	sta.b [$10]
	rtl

.t1:
	sta.b $14
	txy
	dey
	dey
.loopx:
	lda.b [$10],y
	and.b $14
	sta.b [$10],y
	dey
	dey
	bne .loopx
	lda.b [$10]
	and.b $14
	sta.b [$10]
	rtl
