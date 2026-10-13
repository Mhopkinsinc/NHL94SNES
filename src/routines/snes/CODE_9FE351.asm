; Unidentified routine.
CODE_9FE351:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE35B
	jmp.w $E19E
