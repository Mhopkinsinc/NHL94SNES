; Unidentified routine.
CODE_9CA2EE:
	lda.w #$FFFF
	sta.w $0F5B
	sta.w $0F5D
	plb
	jmp.w SprSort
