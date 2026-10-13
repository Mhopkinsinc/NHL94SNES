; Unidentified routine.
CODE_9FB3B6:
	jsl.l CODE_9ED0FD
	lda.w #$FFFF
	sta.w temp1,x
	sta.w temp2,x
	lda.l $7E34C6
	bne CODE_9FB3CC
	jmp.w $B518
