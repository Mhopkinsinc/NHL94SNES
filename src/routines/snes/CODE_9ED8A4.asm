; Unidentified routine.
CODE_9ED8A4:
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9ED8C3
	jmp.w $D992
