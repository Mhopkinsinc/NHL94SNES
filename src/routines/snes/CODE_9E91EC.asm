; Unidentified routine.
CODE_9E91EC:
	lda.w puckvy
	cmp.w #$0800
	bpl CODE_9E920C
	cmp.w #$F800
	bmi CODE_9E920C
	cmp.w #$0000
	bpl .t1
	lda.w #$F800
	sta.w puckvy
	bra CODE_9E920C

.t1:
	lda.w #$0800
	sta.w puckvy
CODE_9E920C:
	jmp.w CODE_9E8F42
