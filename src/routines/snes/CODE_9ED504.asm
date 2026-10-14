; Unidentified routine.
CODE_9ED504:
	dec.w $1063,x
	bpl CODE_9ED50F
	lda.w #$FFFF
	sta.w $1063,x
CODE_9ED50F:
	cpx.w $0AD9
	beq CODE_9ED517
CODE_9ED514:
	jmp.w CODE_9ED5A7
