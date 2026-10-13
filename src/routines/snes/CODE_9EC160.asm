; Unidentified routine.
CODE_9EC160:
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
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w sfhormode
	beq CODE_9EC180
	jmp.w $C265
