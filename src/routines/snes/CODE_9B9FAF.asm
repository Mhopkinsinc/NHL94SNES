; Unidentified routine.
CODE_9B9FAF:
	lda.w sflags
	and.w #$0800
	beq CODE_9B9FBD
	lda.w $0CB9
	bne CODE_9B9FBD
	rtl
