; Unidentified routine.
CODE_9EE771:
	lda.w Ypos,x
	cmp.w #$0058
	bpl CODE_9EE762
CODE_9EE779:
	lda.w puckc
	bmi CODE_9EE796
CODE_9EE77E:
	lda.w #$FFFF
	sta.w $0D07
	stz.w pfalock,x
	stz.w $0BAB
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	jmp.w assexit
