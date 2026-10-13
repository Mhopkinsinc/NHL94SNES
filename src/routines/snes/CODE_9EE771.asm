; Unidentified routine.
CODE_9EE771:
	lda.w Ypos,x
	cmp.w #$0058
	bpl CODE_9EE762
CODE_9EE779:
	lda.w $0AD9
	bmi CODE_9EE796
CODE_9EE77E:
	lda.w #$FFFF
	sta.w $0D07
	stz.w $14E3,x
	stz.w $0BAB
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	jmp.w $8BE6
