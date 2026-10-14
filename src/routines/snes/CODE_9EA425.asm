; Unidentified routine.
CODE_9EA425:
	cpx.w #$0018
	bcs CODE_9EA456
	lda.w attribute,x
	bit.w #$0800
	beq .t1
	lda.w #$0002
	sec
	sbc.w facedir,x
	bra CODE_9EA472

.t1:
	lda.w facedir,x
	dec a
	dec a
	bra CODE_9EA472
