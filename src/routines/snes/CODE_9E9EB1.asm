; Unidentified routine.
CODE_9E9EB1:
	lda.w #$FDFE
CODE_9E9EB4:
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
	ldx.b $95
	ldy.b $91
	jmp.w $9D79
