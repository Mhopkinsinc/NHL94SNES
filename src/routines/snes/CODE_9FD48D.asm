; Unidentified routine.
CODE_9FD48D:
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4A1
	ora.w #$FF00
CODE_9FD4A1:
	sta.w newpos,x
	lda.b $B9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4B1
	ora.w #$FF00
CODE_9FD4B1:
	sta.w newpnum,x
	ldy.b $B5
	sep #$20
	lda.b #$00
	sta.b [$99],y
	rep #$20
CODE_9FD4BE:
	dec.b $B5
	bpl CODE_9FD459
	lda.w #$0005
	sta.b $B5
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
CODE_9FD4D1:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B9
	beq CODE_9FD53A
	dec.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.b $91
	ldx.w tmsort,y
	dex
	dex
CODE_9FD4EA:
	inx
	inx
	stx.b $95
	lda.w newpnum,x
	bit.w #$0080
	bne CODE_9FD4FC
	dec.b $B1
	bpl CODE_9FD4EA
	bra CODE_9FD4FE
