; Unidentified routine.
CODE_9EA021:
	ldy.b $91
	lda.w SPA,y
	cmp.w #$F374
	beq CODE_9EA01E
	cmp.w #$F864
	beq CODE_9EA01E
	cmp.w #$F208
	bne CODE_9EA038
	jmp.w CODE_9EBC24
