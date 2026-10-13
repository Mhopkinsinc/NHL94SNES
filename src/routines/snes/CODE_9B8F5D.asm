; Unidentified routine.
CODE_9B8F5D:
	lda.w $1DA7
	cmp.w $1DAB
	beq CODE_9B8F28
	dec.w $1DA7
	jsl.l CODE_9B8F7B
	lda.w #$FFFF
	sta.w $07E0
	lda.w #$FFFF
	sta.w $07D8
	jmp.w $8F28
