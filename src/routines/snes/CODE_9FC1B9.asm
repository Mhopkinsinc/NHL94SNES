; Unidentified routine.
CODE_9FC1B9:
	jsl.l CODE_9BC174
	dec.b $B5
	dec.b $B5
	lda.b $B1
	bit.w #$1000
	beq CODE_9FC1CE
	lda.b $B5
	jmp.w $936C
