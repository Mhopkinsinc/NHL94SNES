; Unidentified routine.
CODE_9FC1B9:
	jsl.l CODE_9BC174
	dec.b d4
	dec.b d4
	lda.b d3
	bit.w #$1000
	beq CODE_9FC1CE
	lda.b d4
	jmp.w CODE_9F936C
