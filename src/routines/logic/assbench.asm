; Unidentified routine.
assbench:
	lda.w temp1,x
	cmp.w #$0064
	bne CODE_9FD86A
	jmp.w $D96E
