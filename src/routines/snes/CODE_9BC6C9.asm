; Unidentified routine.
CODE_9BC6C9:
	lda.l PassWord
	bit.w #$0080
	beq CODE_9BC6D5
	jmp.w CODE_9BC75D
