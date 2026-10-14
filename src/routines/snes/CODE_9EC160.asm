; Unidentified routine.
CODE_9EC160:
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
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w sfhormode
	beq CODE_9EC180
	jmp.w CODE_9EC265
