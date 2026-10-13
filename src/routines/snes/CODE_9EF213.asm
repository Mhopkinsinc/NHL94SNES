; Unidentified routine.
CODE_9EF213:
	lda.w #$1000
	trb.w sflags
	bne CODE_9EF21E
	jmp.w $F318
