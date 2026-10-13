; Unidentified routine.
updatepentime:
	lda.w #$0020
	trb.w sflags3
	lda.w $15D6
	beq CODE_9EBF52
	jmp.w CODE_80BFDD
