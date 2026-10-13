; Unidentified routine.
CODE_9FE305:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE30F
	jmp.w $E19E
