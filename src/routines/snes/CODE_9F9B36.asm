; Unidentified routine.
CODE_9F9B36:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	stx.b $87
	ldx.w #$0000
CODE_9F9B4D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9F9B4D
	ldx.b $87
	lda.w sfhormode
	beq CODE_9F9B61
	jmp.w $9CFB
