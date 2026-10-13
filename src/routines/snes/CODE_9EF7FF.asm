; Unidentified routine.
CODE_9EF7FF:
	lda.b $91
	beq CODE_9EF829
CODE_9EF803:
	lda.w #$0005
	sta.b $AD
	ldy.b $91
	lda.w tmsort,y
	sta.b $89
CODE_9EF80F:
	ldy.b $89
	lda.w position,y
	bmi CODE_9EF82A
	lda.b $A5
	sec
	sbc.w Ypos,y
	bpl CODE_9EF82A
	ldy.b $91
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
CODE_9EF829:
	rtl
