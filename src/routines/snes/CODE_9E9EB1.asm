; Unidentified routine.
CODE_9E9EB1:
	lda.w #$FDFE
CODE_9E9EB4:
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	ldx.b a3
	ldy.b a2
	jmp.w CODE_9E9D79
