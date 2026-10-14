; Unidentified routine.
CODE_9ED408:
	lda.w $15D6
	bne CODE_9ED415
	cpx.w $0AD9
	beq CODE_9ED415
	jmp.w CODE_9ED44E
