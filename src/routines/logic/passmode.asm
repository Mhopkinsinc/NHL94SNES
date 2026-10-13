; Unidentified routine.
passmode:
	lda.b $AD
	bit.w #$8000
	bne CODE_9EE9BF
	lda.b $A5
	bit.w #$0008
	bne CODE_9EE9BE
	and.w #$0007
	sta.w passdir
	ora.w #$0008
	sta.b $A5
	bra CODE_9EE9BF
