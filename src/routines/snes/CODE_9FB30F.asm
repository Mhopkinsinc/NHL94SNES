; Unidentified routine.
CODE_9FB30F:
	lda.w $0B7D,x
	cmp.w #$0017
	bne CODE_9FB354
	lda.w #$007E
	sta.b $8B
	lda.w #$3122
	sta.b $89
	lda.w pfgoal,x
	beq CODE_9FB330
	lda.w #$007E
	sta.b $8B
	lda.w #$3124
	sta.b $89
CODE_9FB330:
	lda.b $A5
	sta.b [$89]
	lda.w pf2aip,x
	bne CODE_9FB354
	lda.b $A9
	bit.w #$8000
	beq CODE_9FB34D
	lda.w #$0001
	sta.w pf2aip,x
	lda.w #SPAfaceoff
	jml.l CODE_9EA3F1
