; Unidentified routine.
CODE_9E9EB1:
	lda.w #DATA8_9DFDFE
CODE_9E9EB4:
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	ldx.b $95
	ldy.b $91
	jmp.w $9D79
