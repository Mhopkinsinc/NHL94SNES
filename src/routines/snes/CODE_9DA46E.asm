; Unidentified routine.
CODE_9DA46E:
	bit.w #$0100
	beq CODE_9DA486
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9DA486
	cmp.w #$0002
	beq CODE_9DA45A
	lda.w #$0001
	sta.w $1C84,x
CODE_9DA486:
	inx
	inx
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA496
	cpx.w #$0004
	bcs CODE_9DA49E
CODE_9DA496:
	cpx.w #$000A
	bcs CODE_9DA49E
	jmp.w $A2F5
