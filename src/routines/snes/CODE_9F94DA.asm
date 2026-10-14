; Unidentified routine.
CODE_9F94DA:
	ldx.b a0
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F951B
	cmp.l $7E3558,x
	beq CODE_9F951B
	stz.b d3
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F94FB
	lda.w #$0010
	sta.b d3
CODE_9F94FB:
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bpl CODE_9F950C
	lda.b d3
	eor.w #$0010
	sta.b d3
CODE_9F950C:
	lda.b a0
	clc
	adc.b d3
	tax
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
CODE_9F951B:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl CODE_9F94DA
	inc.w $0ACF
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F9531
	jmp.w CODE_9F95C2
