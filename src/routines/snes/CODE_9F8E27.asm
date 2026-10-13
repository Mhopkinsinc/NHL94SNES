; Unidentified routine.
CODE_9F8E27:
	jsl.l CODE_9F92CB
	lda.b $A9
	sta.b $B1
	jsl.l CODE_9FA476
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E3E
	jmp.w $9243
