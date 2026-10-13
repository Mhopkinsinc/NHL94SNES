; Unidentified routine.
CODE_9FA078:
	lda.w sflags
	bit.w #$0800
	beq CODE_9FA083
	jmp.w $A12F
