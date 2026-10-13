; Unidentified routine.
CODE_9C902A:
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C92FD
	sta.b $89
	lda.w $1DB9
	sta.b $A5
CODE_9C9039:
	lda.b [$89]
	bpl CODE_9C9040
	jmp.w $9167
