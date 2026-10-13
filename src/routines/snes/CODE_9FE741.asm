; Unidentified routine.
CODE_9FE741:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE74B
	jmp.w $E19E
