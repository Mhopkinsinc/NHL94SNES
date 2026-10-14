; Unidentified routine.
CODE_9EFA36:
	phx
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b d0
	cmp.w #$0040
	bne CODE_9EFA5F
	jmp.w CODE_9EFAF7
