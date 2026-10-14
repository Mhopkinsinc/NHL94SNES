; Unidentified routine.
CODE_9E91EC:
	lda.w puckvy
	cmp.w #$0800
	bpl .1
	cmp.w #$F800
	bmi .1
	cmp.w #$0000
	bpl .t1
	lda.w #$F800
	sta.w puckvy
	bra .1

.t1:
	lda.w #$0800
	sta.w puckvy
.1:
	jmp.w wallcoll
