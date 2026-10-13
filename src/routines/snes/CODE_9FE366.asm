; Unidentified routine.
CODE_9FE366:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE370
	jmp.w $E19E
