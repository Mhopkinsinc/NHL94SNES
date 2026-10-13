; Unidentified routine.
CODE_9EA021:
	ldy.b $91
	lda.w SPA,y
	cmp.w #DATA8_9DF374
	beq CODE_9EA01E
	cmp.w #DATA8_9DF864
	beq CODE_9EA01E
	cmp.w #SPAsweepchk
	bne CODE_9EA038
	jmp.w $BC24
