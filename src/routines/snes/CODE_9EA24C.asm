; Unidentified routine.
CODE_9EA24C:
	lda.w position,x
	beq CODE_9EA25E
	lda.w $14E3,x
	beq CODE_9EA25F
	lda.w SPA,x
	cmp.w #$F342
	bne CODE_9EA25F
CODE_9EA25E:
	rtl
