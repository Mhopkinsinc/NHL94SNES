; Unidentified routine.
CODE_9FE37B:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l CODE_9BC25A
	jsl.l CODE_9FE79F
	jmp.w CODE_9FE2AE
