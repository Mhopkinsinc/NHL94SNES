; Unidentified routine.
CODE_9FD2FE:
	lda.l $7E34C6
	cmp.w #$0001
	bne CODE_9FD324
	jsl.l CODE_9FC757
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0008
	bne CODE_9FD324
	ora.w #$0008
	sta.w tmflags,y
	lda.w #$000C
	trb.w sflags
	jmp.w CODE_9FD325
