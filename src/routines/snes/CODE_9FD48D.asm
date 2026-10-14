; Unidentified routine.
CODE_9FD48D:
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4A1
	ora.w #$FF00
CODE_9FD4A1:
	sta.w newpos,x
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4B1
	ora.w #$FF00
CODE_9FD4B1:
	sta.w newpnum,x
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
CODE_9FD4BE:
	dec.b d4
	bpl CODE_9FD459
	lda.w #$0005
	sta.b d4
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b a4
CODE_9FD4D1:
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d5
	beq CODE_9FD53A
	dec.b d5
	lda.w #$0005
	sta.b d3
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
CODE_9FD4EA:
	inx
	inx
	stx.b a3
	lda.w newpnum,x
	bit.w #$0080
	bne CODE_9FD4FC
	dec.b d3
	bpl CODE_9FD4EA
	bra CODE_9FD4FE
