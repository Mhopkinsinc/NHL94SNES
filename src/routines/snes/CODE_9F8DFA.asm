; Unidentified routine.
CODE_9F8DFA:
	stx.b xsave
	ldx.w #$0000
CODE_9F8DFF:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9F8DFF
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
CODE_9F8E10:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9F8E10
	ldx.b xsave
StartHL2:
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E27
	jmp.w CODE_9F9276
