; Unidentified routine.
CODE_9EF890:
	lda.b $91
	beq CODE_9EF829
CODE_9EF894:
	lda.w #$0005
	sta.b $AD
	ldy.b $91
	lda.w tmsort,y
	sta.b $89
CODE_9EF8A0:
	ldy.b $89
	lda.w position,y
	bmi CODE_9EF8BB
	lda.b $A5
	sec
	sbc.w Ypos,y
	bmi CODE_9EF8BB
	ldy.b $91
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
	rtl
