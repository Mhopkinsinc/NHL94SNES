; Unidentified routine.
CODE_9DA724:
	stx.b $AF
	txa
	beq CODE_9DA758
	bit.w #$0001
	bne CODE_9DA73A
	bit.w #$0002
	bne CODE_9DA744
	bit.w #$0004
	bne CODE_9DA74E
	bra CODE_9DA768
