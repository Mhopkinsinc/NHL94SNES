; Unidentified routine.
CODE_9DA869:
	lda.b $A9
	bit.w #$1000
	beq CODE_9DA873
	jmp.w CODE_9DA7D7
