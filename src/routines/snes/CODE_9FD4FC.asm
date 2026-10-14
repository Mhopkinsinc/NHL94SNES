; Unidentified routine.
CODE_9FD4FC:
	stx.b a0
CODE_9FD4FE:
	lda.w position,x
	bpl CODE_9FD507
	dec.b d3
	bpl CODE_9FD4EA
CODE_9FD507:
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD51B
	ora.w #$FF00
CODE_9FD51B:
	ldy.b a0
	sta.w newpos,y
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD52D
	ora.w #$FF00
CODE_9FD52D:
	sta.w newpnum,y
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
CODE_9FD53A:
	dec.b d4
	bpl CODE_9FD4D1
	stx.b xsave
	ldx.w #$0012
CODE_9FD543:
	pla
	sta.b a0,x
	dex
	dex
	bpl CODE_9FD543
	ldx.b xsave
	stx.b xsave
	ldx.w #$0016
CODE_9FD551:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9FD551
	ldx.b xsave
	ldx.b a3
	rtl
