; Unidentified routine.
CODE_9FB3B6:
	jsl.l CODE_9ED0FD
	lda.w #$FFFF
	sta.w $1003,x
	sta.w $1023,x
	lda.l $7E34C6
	bne CODE_9FB3CC
	jmp.w CODE_9FB518
