; Unidentified routine.
CODE_9ECE15:
	phx
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
	ldy.w #$0002
CODE_9ECE2B:
	tya
	cmp.b [$8D]
	bne CODE_9ECE33
	jmp.w CODE_9ECF91
