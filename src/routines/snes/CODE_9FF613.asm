; Unidentified routine.
CODE_9FF613:
	lda.b $B7
	sta.b $B5
	lda.b $B5
	cmp.w #$000D
	beq CODE_9FF623
	lda.w $0776
	beq CODE_9FF623
CODE_9FF623:
	lda.b $C3
	beq CODE_9FF62A
	jmp.w $F898
