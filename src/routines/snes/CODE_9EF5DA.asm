; Unidentified routine.
CODE_9EF5DA:
	ldy.b $91
	lda.w position,y
	bne CODE_9EF5EA
	lda.w gmode
	bit.w #$0010
	beq CODE_9EF5EA
CODE_9EF5E9:
	rtl
