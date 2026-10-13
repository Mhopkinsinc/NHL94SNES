; Unidentified routine.
CODE_9CA0B1:
	lda.w #$15C3
	sta.b $99
CODE_9CA0B6:
	lda.b ($99)
	and.w #$00FF
	tax
	lda.w #$0000
	cpx.w #$001C
	bne CODE_9CA0C7
	lda.w $0DF9
CODE_9CA0C7:
	cpx.w #$001E
	bne CODE_9CA0CF
	lda.w $0DFB
CODE_9CA0CF:
	sta.b $AD
	cpx.w #$0018
	bcs CODE_9CA107
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9CA0E4
	lda.w position,x
	bmi CODE_9CA0FE
CODE_9CA0E4:
	lda.w $0D97,x
	cmp.w #$0170
	beq CODE_9CA0F1
	cmp.w #$0171
	bne CODE_9CA107
CODE_9CA0F1:
	lda.w sfhormode
	bne CODE_9CA101
	lda.w #$0171
	sta.w $0D97,x
	bra CODE_9CA107
