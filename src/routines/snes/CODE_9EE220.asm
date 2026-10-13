; Unidentified routine.
CODE_9EE220:
	jsl.l CODE_9EDFF7
	lda.w #$0007
	pha
	lda.w #$0008
	trb.w sflags
	sta.w pfalock,x
	stx.w $0D29
	cpx.w puckc
	beq CODE_9EE23C
	jmp.w $E408
