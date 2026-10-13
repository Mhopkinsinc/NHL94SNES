; Unidentified routine.
CODE_9EECF6:
	stx.w $0BA3
	lda.w position,x
	beq CODE_9EED6D
	lda.w pfgoal,x
	bne CODE_9EED38
	lda.w Ypos,x
	cmp.w #$FFA8
	bmi CODE_9EED24
CODE_9EED0B:
	lda.w #$0004
	sta.w passdir
	lda.w Xpos,x
	bmi CODE_9EED1D
	lda.w #$000A
	sta.w $0BA5
	rtl
