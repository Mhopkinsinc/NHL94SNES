; Unidentified routine.
CODE_9FF613:
	lda.b $B7
	sta.b d4
	lda.b d4
	cmp.w #$000D
	beq CODE_9FF623
	lda.w JoyPad
	beq CODE_9FF623
CODE_9FF623:
	lda.b $C3
	beq CODE_9FF62A
	jmp.w CODE_9FF898
