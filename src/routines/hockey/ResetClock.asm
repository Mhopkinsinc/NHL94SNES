; Set the period length and stop the clock
ResetClock:
	jsl.l GetPeriodTime
	lda.w shootoutmode
	beq .t1
	lda.w #$0019
	sta.b d0
	bra .1

.t1:
	lda.w gsp
	cmp.w #$0003
	bmi .1
	lda.l OptPlayMode
	bne .1
	lda.w #$012C
	sta.b d0
.1:
	lda.b d0
	sta.w gameclock
	sta.w PerTimeTotal
	sta.w gmclock
	rtl
