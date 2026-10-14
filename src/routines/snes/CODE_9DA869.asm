; Unidentified routine.
CODE_9DA869:
	lda.b d1
	bit.w #$1000
	beq .t2
	jmp.w CODE_9DA7D7

.t2:
	bit.w #DMA_OAM
	beq .t1
	lda.w #$0002
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF

.t1:
	bit.w #$0800
	beq CODE_9DA899
	lda.w #$FFFE
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
CODE_9DA896:
	jmp.w CODE_9DA6FF
