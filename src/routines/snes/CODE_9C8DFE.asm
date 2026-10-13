; Unidentified routine.
CODE_9C8DFE:
	jsl.l WaitFrame
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	beq CODE_9C8E10
	jmp.w $8E9B
