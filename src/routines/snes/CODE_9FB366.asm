; Unidentified routine.
CODE_9FB366:
	lda.w #$FFFF
	sta.w $0AD9
	jsl.l CODE_9EDCC3
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9FB37B
CODE_9FB378:
	jmp.w $B518
