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
CODE_8085A4:
	jsl.l WaitFrame
	dex
	bne .t1
	dey
	bne .t1
	lda.w #$0000
	rtl

.t1:
	lda.w JoyPad
	beq CODE_8085A4
	rtl

.t2:
	iny
CODE_8085B9:
	jsl.l WaitFrame
	dex
	bne .t1
	dey
	bne .t1
	lda.w #$0000
	rtl

.t1:
	lda.w $0778
	beq CODE_8085B9
	rtl

.t2:
	sta.b $14
	iny
CODE_8085D0:
	jsl.l WaitFrame
	dex
	bne .t1
	dey
	bne .t1
	lda.w #$0000
	rtl

.t1:
	lda.w JoyPad
	and.b $14
	beq CODE_8085D0
	rtl

.t2:
	sta.b $14
	iny
CODE_8085E9:
	jsl.l WaitFrame
	dex
	bne .t1
	dey
	bne .t1
	lda.w #$0000
	rtl

.t1:
	lda.w $0778
	and.b $14
	beq CODE_8085E9
	rtl
