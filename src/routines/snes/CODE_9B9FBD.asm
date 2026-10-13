; Unidentified routine.
CODE_9B9FBD:
	jsl.l CODE_9BA1A1
	ldx.w #$0022
	lda.w HomeTeam
	cmp.w #$0013
	bne CODE_9B9FDC
	lda.w $0C53
	bne CODE_9B9FD9
	lda.w $0CC3
	cmp.w #$0002
	bne CODE_9B9FDC
CODE_9B9FD9:
	ldx.w #$0028
CODE_9B9FDC:
	stx.b $08
	cpx.w #$0000
	beq CODE_9B9FE8
	cpx.w #$000A
	bne CODE_9B9FF0
CODE_9B9FE8:
	lda.w $0C53
	beq CODE_9B9FF0
	jmp.w $A076
