; Unidentified routine.
CODE_9FB1FD:
	lda.w sfhormode
	bne CODE_9FB269
	lda.w $1E9B
	bne CODE_9FB269
	lda.w sflags
	bit.w #$0100
	beq CODE_9FB269
	bit.w #$0800
	bne CODE_9FB269
	stz.w $0CD3
	lda.w #$3000
	sta.w $0CCB
	ldx.w #$0000
CODE_9FB220:
	lda.l $7E3126
	sta.w $0CCF
	lda.l $7E3128
	sta.w $0CD1
	lda.l $7E312A,x
	clc
	adc.w #$01A6
	sta.w $0CCD
	lda.l $7E312C,x
	and.w #$0800
	sta.w $0CC5
	lda.w #$0000
	cpx.w #$0004
	bne CODE_9FB24E
	lda.w #$0200
CODE_9FB24E:
	ora.w $0CCB
	sta.w $0CC9
	phx
	jsl.l CODE_9BBFB9
	plx
	inx
	inx
	inx
	inx
	cpx.w #$000C
	bne CODE_9FB220
	lda.w #$2000
	sta.w $0CCB
CODE_9FB269:
	rtl
