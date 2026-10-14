; Unidentified routine.
CODE_9EEF7F:
	lda.w $0DF9
	cmp.w #$0008
	bpl CODE_9EEF91
	lda.b $A5
	and.w #$000F
	beq CODE_9EEF91
	jmp.w CODE_9EF02A
