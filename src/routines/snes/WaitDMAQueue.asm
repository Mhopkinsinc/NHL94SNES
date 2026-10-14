; Unidentified routine.
WaitDMAQueue:
	pha
.loop:
	lda.b $3A
	cmp.b $3C
	bne .loop
	pla
	rtl

.t1:
	iny
.1:
	jsl.l WaitFrame
	dex
	bne .t1x
	dey
	bne .t1x
	lda.w #$0000
	rtl

.t1x:
	lda.w JoyPad
	beq .1
	rtl

.t2:
	iny
.2:
	jsl.l WaitFrame
	dex
	bne .t1xx
	dey
	bne .t1xx
	lda.w #$0000
	rtl

.t1xx:
	lda.w $0778
	beq .2
	rtl

.t2x:
	sta.b $14
	iny
.3:
	jsl.l WaitFrame
	dex
	bne .t1xxx
	dey
	bne .t1xxx
	lda.w #$0000
	rtl

.t1xxx:
	lda.w JoyPad
	and.b $14
	beq .3
	rtl

.t2xx:
	sta.b $14
	iny
.4:
	jsl.l WaitFrame
	dex
	bne .t1xxxx
	dey
	bne .t1xxxx
	lda.w #$0000
	rtl

.t1xxxx:
	lda.w $0778
	and.b $14
	beq .4
	rtl
