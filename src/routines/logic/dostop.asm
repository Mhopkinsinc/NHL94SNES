; Unidentified routine.
dostop:
	lda.w Xvel,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bpl CODE_9EA511
	lda.w Yvel,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bmi CODE_9EA539
CODE_9EA511:
	lda.w #SPAglide
	ldy.w pfrev,x
	bne CODE_9EA535
	cpx.w puckc
	bne CODE_9EA52F
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	lda.w #$0011
	jsl.l CODE_9C9AD0
CODE_9EA52F:
	lda.w #SPAstop
	sta.w pf2aip,x
CODE_9EA535:
	jsl.l CODE_9EA3F1
CODE_9EA539:
	lda.w position,x
	bne CODE_9EA55D
	lda.w $19D4,x
	bmi CODE_9EA55D
	cpx.w puckc
	beq CODE_9EA55D
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	rtl
