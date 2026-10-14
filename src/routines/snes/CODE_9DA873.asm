; Unidentified routine.
CODE_9DA873:
	bit.w #$0400
	beq CODE_9DA886
	lda.w #$0002
	sta.b $A5
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF
