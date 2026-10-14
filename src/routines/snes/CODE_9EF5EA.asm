; Unidentified routine.
CODE_9EF5EA:
	lda.w pflags,y
	and.w #$FFFE
	sta.w pflags,y
	ldy.w $0AD9
	bpl CODE_9EF5FB
	jmp.w CODE_9EF69A
