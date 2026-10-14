; Unidentified routine.
CODE_9FE2F1:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l CODE_9D9D26
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
