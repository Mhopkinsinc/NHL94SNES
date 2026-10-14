; Unidentified routine.
CODE_9EF890:
	lda.b a2
	beq CODE_9EF829
CODE_9EF894:
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
CODE_9EF8A0:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EF8BB
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi CODE_9EF8BB
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
	rtl
