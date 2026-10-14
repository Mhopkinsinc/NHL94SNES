; Follows the line-choice table. Compares one object word with 100, then continues.
CODE_9FD85F:
	lda.w $1003,x
	cmp.w #$0064
	bne CODE_9FD86A
	jmp.w CODE_9FD96E
