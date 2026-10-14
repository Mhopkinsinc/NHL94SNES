; Unidentified routine.
CODE_9C8E22:
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	bne CODE_9C8E9B
	bit.w #$0800
	bne CODE_9C8E9C
	bit.w #$0400
	beq CODE_9C8E3A
	jmp.w CODE_9C8EDD
