; Unidentified routine.
CODE_9FE2BB:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l ShowGameStats
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
