; Unidentified routine.
CODE_9FD4FC:
	stx.b $89
CODE_9FD4FE:
	lda.w position,x
	bpl CODE_9FD507
	dec.b $B1
	bpl CODE_9FD4EA
CODE_9FD507:
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD51B
	ora.w #$FF00
CODE_9FD51B:
	ldy.b $89
	sta.w newpos,y
	lda.b $B9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD52D
	ora.w #$FF00
CODE_9FD52D:
	sta.w newpnum,y
	ldy.b $B5
	sep #$20
	lda.b #$00
	sta.b [$99],y
	rep #$20
CODE_9FD53A:
	dec.b $B5
	bpl CODE_9FD4D1
	stx.b $87
	ldx.w #$0012
CODE_9FD543:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FD543
	ldx.b $87
	stx.b $87
	ldx.w #$0016
CODE_9FD551:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FD551
	ldx.b $87
	ldx.b $95
	rtl
