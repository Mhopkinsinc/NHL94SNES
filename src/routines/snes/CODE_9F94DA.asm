; Unidentified routine.
CODE_9F94DA:
	ldx.b $89
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F951B
	cmp.l $7E3558,x
	beq CODE_9F951B
	stz.b $B1
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F94FB
	lda.w #$0010
	sta.b $B1
CODE_9F94FB:
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bpl CODE_9F950C
	lda.b $B1
	eor.w #$0010
	sta.b $B1
CODE_9F950C:
	lda.b $89
	clc
	adc.b $B1
	tax
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
CODE_9F951B:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F94DA
	inc.w $0ACF
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F9531
	jmp.w CODE_9F95C2
