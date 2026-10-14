; Unidentified routine.
CODE_9C902A:
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C92FD
	sta.b a0
	lda.w $1DB9
	sta.b d0
CODE_9C9039:
	lda.b [a0]
	bpl CODE_9C9040
	jmp.w CODE_9C9167
