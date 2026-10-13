; Unidentified routine.
CODE_9EB2C9:
	lda.w #$FFFF
	tsb.w gmclock
	beq CODE_9EB2D4
	jmp.w $B388
