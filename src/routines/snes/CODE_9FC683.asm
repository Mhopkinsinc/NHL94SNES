; Unidentified routine.
CODE_9FC683:
	jsl.l GetPeriodTime
	lda.w $1D81
	beq .t1
	lda.w #$0019
	sta.b d0
	bra CODE_9FC6A6

.t1:
	lda.w gsp
	cmp.w #$0003
	bmi CODE_9FC6A6
	lda.l $7E34BC
	bne CODE_9FC6A6
	lda.w #$012C
	sta.b d0
CODE_9FC6A6:
	lda.b d0
	sta.w gameclock
	sta.w PerTimeTotal
	sta.w gmclock
	rtl
