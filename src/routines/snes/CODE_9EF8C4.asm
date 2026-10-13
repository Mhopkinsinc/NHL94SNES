; Unidentified routine.
CODE_9EF8C4:
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9EF8D1
	jmp.w $F829
