; Unidentified routine.
CODE_9EF7D6:
	lda.w #$005E
	sta.b d0
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF7EB
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
CODE_9EF7EB:
	lda.w $0AD9
	bpl CODE_9EF7F4
	lda.w $0CF3
	asl a
CODE_9EF7F4:
	cmp.w #$000C
	bpl CODE_9EF7FF
	lda.b a2
	beq CODE_9EF803
	bra CODE_9EF829
