; Unidentified routine.
CODE_9FB30F:
	lda.w $0B7D,x
	cmp.w #$0017
	bne CODE_9FB354
	lda.w #$007E
	sta.b $8B
	lda.w #$3122
	sta.b a0
	lda.w pfgoal,x
	beq CODE_9FB330
	lda.w #$007E
	sta.b $8B
	lda.w #$3124
	sta.b a0
CODE_9FB330:
	lda.b d0
	sta.b [a0]
	lda.w $1543,x
	bne CODE_9FB354
	lda.b d1
	bit.w #$8000
	beq CODE_9FB34D
	lda.w #$0001
	sta.w $1543,x
	lda.w #$F600
	jml.l CODE_9EA3F1
