; Unidentified routine.
CODE_80B2BD:
	lda.b $1E
	sec
	sbc.w $07CA
	sec
	sbc.w #$0007
CODE_80B2C7:
	cmp.w #$FFF0
	bmi CODE_80B2D1
	cmp.w #$00E0
	bmi CODE_80B2D4
CODE_80B2D1:
	jmp.w CODE_80B37D
