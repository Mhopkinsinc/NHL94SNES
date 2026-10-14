; Unidentified routine.
CODE_9DA886:
	bit.w #$0800
	beq CODE_9DA899
	lda.w #$FFFE
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
CODE_9DA896:
	jmp.w CODE_9DA6FF
