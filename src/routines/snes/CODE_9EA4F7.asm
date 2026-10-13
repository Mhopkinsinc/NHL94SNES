; Unidentified routine.
CODE_9EA4F7:
	lda.w $0EC3,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bpl CODE_9EA511
	lda.w $0EE3,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bmi CODE_9EA539
CODE_9EA511:
	lda.w #$EA1A
	ldy.w $1523,x
	bne CODE_9EA535
	cpx.w $0AD9
	bne CODE_9EA52F
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	lda.w #$0011
	jsl.l CODE_9C9AD0
CODE_9EA52F:
	lda.w #$EC14
	sta.w $1543,x
CODE_9EA535:
	jsl.l CODE_9EA3F1
CODE_9EA539:
	lda.w position,x
	bne CODE_9EA55D
	lda.w $19D4,x
	bmi CODE_9EA55D
	cpx.w $0AD9
	beq CODE_9EA55D
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	rtl
