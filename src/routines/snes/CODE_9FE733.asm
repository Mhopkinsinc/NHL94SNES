; Unidentified routine.
CODE_9FE733:
	lda.b d1
	bit.w #$9080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	lda.w #$0000
	rtl
