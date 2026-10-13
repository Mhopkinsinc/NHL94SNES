; Unidentified routine.
CODE_9EF5EA:
	lda.w pflags,y
	and.w #$FFFE
	sta.w pflags,y
	ldy.w puckc
	bpl CODE_9EF5FB
	jmp.w $F69A
