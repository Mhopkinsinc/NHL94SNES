; Unidentified routine.
CODE_9EB94C:
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
	lda.w gsp
	cmp.w #$0003
	beq CODE_9EB9D1
	lda.w #PenBuf
	sta.b a0
CODE_9EB971:
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB971
	cmp.w #$0000
	bne CODE_9EB987
	jmp.w CODE_9EB9D5
