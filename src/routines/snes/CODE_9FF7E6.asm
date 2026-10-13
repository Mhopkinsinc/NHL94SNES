; Unidentified routine.
CODE_9FF7E6:
	lda.b $BB
	beq CODE_9FF7F2
CODE_9FF7EA:
	lda.w #$0005
	sta.b $B7
	jmp.w $F898
