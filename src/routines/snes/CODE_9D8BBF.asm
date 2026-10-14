; Unidentified routine.
CODE_9D8BBF:
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0000
	sta.l $7E35AA
	sta.l $7E35AC
	lda.l $7E34BC
	bne CODE_9D8BDE
	jmp.w CODE_9D9064
