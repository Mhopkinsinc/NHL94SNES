; Unidentified routine.
CODE_9DA873:
	bit.w #DMA_OAM
	beq CODE_9DA886
	lda.w #$0002
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF
