; Unidentified routine.
CODE_9EF714:
	ldy.b $91
	lda.w #$0008
	sta.w nopuck,y
	jmp.w $F68B
