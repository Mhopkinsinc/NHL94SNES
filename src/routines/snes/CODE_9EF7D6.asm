; Unidentified routine.
CODE_9EF7D6:
	lda.w #$005E
	sta.b $A5
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF7EB
	lda.b $91
	ldy.b $8D
	sty.b $91
	sta.b $8D
CODE_9EF7EB:
	lda.w $0AD9
	bpl CODE_9EF7F4
	lda.w $0CF3
	asl a
CODE_9EF7F4:
	cmp.w #$000C
	bpl CODE_9EF7FF
	lda.b $91
	beq CODE_9EF803
	bra CODE_9EF829
