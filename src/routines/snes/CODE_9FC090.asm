; Unidentified routine.
CODE_9FC090:
	lda.w $0D4D
	sta.b $AD
	lda.w $0D4B
	sta.b $B1
	lda.w sflags
	bit.w #$0040
	bne CODE_9FC102
	ldx.w #$001C
	lda.w puckc
	bmi CODE_9FC0DB
	tax
	lda.w pfgoal,x
	beq CODE_9FC0C6
	lda.w $0D4F
	adc.w $0CDD
	sta.w $0D4F
	cmp.w #$0032
	bmi CODE_9FC0DB
	lda.w #$0032
	sta.w $0D4F
	bra CODE_9FC0DB
