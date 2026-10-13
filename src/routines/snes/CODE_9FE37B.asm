; Unidentified routine.
CODE_9FE37B:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE385
	jmp.w $E19E
