; Unidentified routine.
CODE_9EED38:
	lda.w Ypos,x
	cmp.w #$0058
	bpl CODE_9EED59
	lda.w #$0000
	sta.w passdir
	lda.w Xpos,x
	bmi CODE_9EED52
	lda.w #$0016
	sta.w $0BA5
	rtl
