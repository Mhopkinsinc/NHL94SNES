; Unidentified routine.
CODE_9DA899:
	lda.w #$0001
	sta.b d2
	lda.b d1
	bit.w #$0100
	bne .1
	bit.w #$0200
	beq CODE_9DA896
	lda.w #$FFFF
	sta.b d2
.1:
	jsr.w CODE_9DA8B8
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF
