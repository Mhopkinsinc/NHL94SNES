; Unidentified routine.
CODE_9ED408:
	lda.w gmclock
	bne CODE_9ED415
	cpx.w puckc
	beq CODE_9ED415
	jmp.w $D44E
