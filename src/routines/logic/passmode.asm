; Unidentified routine.
passmode:
	lda.b d2
	bit.w #$8000
	bne CODE_9EE9BF
	lda.b d0
	bit.w #$0008
	bne .t1
	and.w #$0007
	sta.w passdir
	ora.w #$0008
	sta.b d0
	bra CODE_9EE9BF

.t1:
	rtl
