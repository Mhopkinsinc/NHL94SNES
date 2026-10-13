; Unidentified routine.
AddPenalty:
	lda.w $15D6
	bne CODE_9EB889
	lda.w $163A
	bne CODE_9EB889
	lda.b $A5
	cmp.w #$000C
	beq CODE_9EB88A
	cmp.w #$0024
	beq CODE_9EB88A
	lda.l $7E34C4
	beq CODE_9EB889
	lda.w gmode
	bit.w #$0020
	bne CODE_9EB88A
	lda.b $A5
	cmp.w #$0012
	bne CODE_9EB88A
CODE_9EB889:
	rtl
