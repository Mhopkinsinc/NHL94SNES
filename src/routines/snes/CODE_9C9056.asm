; Unidentified routine.
CODE_9C9056:
	lda.b [a0]
	and.w #$000F
	inc.b a0
	inc.b a0
	cmp.w #$0001
	bne CODE_9C9067
	jmp.w CODE_9C90F0
