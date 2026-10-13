; Unidentified routine.
CODE_9F8DFA:
	stx.b $87
	ldx.w #$0000
CODE_9F8DFF:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9F8DFF
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9F8E10:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9F8E10
	ldx.b $87
CODE_9F8E1C:
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E27
	jmp.w $9276
