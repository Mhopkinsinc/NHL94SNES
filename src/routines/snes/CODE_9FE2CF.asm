; Unidentified routine.
CODE_9FE2CF:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	lda.w #$0001
	sta.l $7E346A
	jsl.l ShootoutShooters
	lda.w #$0000
	sta.l $7E346A
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
