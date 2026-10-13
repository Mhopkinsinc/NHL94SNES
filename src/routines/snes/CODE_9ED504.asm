; Unidentified routine.
CODE_9ED504:
	dec.w temp4,x
	bpl CODE_9ED50F
	lda.w #$FFFF
	sta.w temp4,x
CODE_9ED50F:
	cpx.w puckc
	beq CODE_9ED517
CODE_9ED514:
	jmp.w $D5A7
