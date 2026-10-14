; Unidentified routine.
CODE_9EC9B1:
	lda.w VertLineScrolling
	cmp.w #$0001
	bmi .1
	jsl.l ScrollDisplayUp
.1:
	jsl.l ScrollDisplayUp
	lda.b $8F
	sta.b $93
	lda.b a1
	sta.b a2
	bra CODE_9EC9D7
