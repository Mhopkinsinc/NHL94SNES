; Unidentified routine.
CODE_9FC331:
	cpx.w puckc
	beq CODE_9FC371
	lda.b $A9
	bit.w #$8000
	bne CODE_9FC326
	bit.w #$0040
	beq CODE_9FC345
	jmp.w DATA16_80C2BA
