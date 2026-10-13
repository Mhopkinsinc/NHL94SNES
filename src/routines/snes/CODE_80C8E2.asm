; Unidentified routine.
CODE_80C8E2:
	sty.w $1E93
CODE_80C8E5:
	jsl.l CODE_9EC72D
	lda.b $91
	beq CODE_80C918
	lda.w shootoutround
CODE_80C8F0:
	cmp.w #$0006
	bmi CODE_80C8FB
	sec
	sbc.w #$0005
	bra CODE_80C8F0
