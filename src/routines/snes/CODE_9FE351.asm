; Unidentified routine.
CODE_9FE351:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l CODE_9B9768
	jsl.l CODE_9FE79F
	jmp.w CODE_9FE2AE
