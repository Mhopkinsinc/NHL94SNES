; Unidentified routine.
CODE_9EF864:
	lda.b d0
	sec
	sbc.w #$000A
	sta.b d0
	lda.w gmode
	bit.w #$0002
	bne CODE_9EF87C
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
CODE_9EF87C:
	lda.w $0AD9
	bpl CODE_9EF885
	lda.w $0CF3
	asl a
CODE_9EF885:
	cmp.w #$000C
	bpl CODE_9EF890
	lda.b a2
	beq CODE_9EF894
	bra CODE_9EF829
