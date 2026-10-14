; Unidentified routine.
CODE_9DA30B:
	lda.w $0AB8,x
	bit.w #$1000
	bne CODE_9DA316
	jmp.w CODE_9DA44B
