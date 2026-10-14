; Unidentified routine.
CODE_9E8F9E:
	lda.w #$1000
	trb.w sflags
	lda.b $AD
	bmi CODE_9E8FAB
	jmp.w CODE_9E9091
