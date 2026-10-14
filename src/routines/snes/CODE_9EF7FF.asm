; Unidentified routine.
CODE_9EF7FF:
	lda.b a2
	beq CODE_9EF829
CODE_9EF803:
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
CODE_9EF80F:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EF82A
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl CODE_9EF82A
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
CODE_9EF829:
	rtl
