; Unidentified routine.
CODE_9FF811:
	lda.b $BB
	beq CODE_9FF81D
CODE_9FF815:
	lda.w #$0007
	sta.b $B7
	jmp.w CODE_9FF898
