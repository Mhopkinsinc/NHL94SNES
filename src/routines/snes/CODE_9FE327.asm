; Unidentified routine.
CODE_9FE327:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE331
	jmp.w $E19E
