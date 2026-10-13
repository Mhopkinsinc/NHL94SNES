; Unidentified routine.
CODE_9EE220:
	jsl.l CODE_9EDFF7
	lda.w #$0007
	pha
	lda.w #$0008
	trb.w sflags
	sta.w $14E3,x
	stx.w $0D29
	cpx.w $0AD9
	beq CODE_9EE23C
	jmp.w $E408
