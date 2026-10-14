; Unidentified routine.
CODE_9ED408:
	lda.w gmclock
	bne CODE_9ED415
	cpx.w $0AD9
	beq CODE_9ED415
	jmp.w CODE_9ED44E
