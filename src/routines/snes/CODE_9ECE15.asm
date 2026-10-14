; Unidentified routine.
CODE_9ECE15:
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
	ldy.w #$0002
CODE_9ECE2B:
	tya
	cmp.b [a1]
	bne CODE_9ECE33
	jmp.w CODE_9ECF91
