; Unidentified routine.
CODE_9EF864:
	lda.b $A5
	sec
	sbc.w #$000A
	sta.b $A5
	lda.w gmode
	bit.w #$0002
	bne CODE_9EF87C
	lda.b $91
	ldy.b $8D
	sty.b $91
	sta.b $8D
CODE_9EF87C:
	lda.w $0AD9
	bpl CODE_9EF885
	lda.w $0CF3
	asl a
CODE_9EF885:
	cmp.w #$000C
	bpl CODE_9EF890
	lda.b $91
	beq CODE_9EF894
	bra CODE_9EF829
