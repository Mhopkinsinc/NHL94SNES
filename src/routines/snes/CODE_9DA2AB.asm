; Unidentified routine.
CODE_9DA2AB:
	stx.b $AD
	txa
	beq CODE_9DA2DF
	bit.w #$0001
	bne CODE_9DA2C1
	bit.w #$0002
	bne CODE_9DA2CB
	bit.w #$0004
	bne CODE_9DA2D5
	bra CODE_9DA2E6
