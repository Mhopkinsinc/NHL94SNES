; Unidentified routine.
CODE_9F9B36:
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
	stx.b xsave
	ldx.w #$0000
CODE_9F9B4D:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9F9B4D
	ldx.b xsave
	lda.w sfhormode
	beq CODE_9F9B61
	jmp.w CODE_9F9CFB
