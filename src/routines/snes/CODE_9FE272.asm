; Unidentified routine.
CODE_9FE272:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE27C
	jmp.w $E19E
