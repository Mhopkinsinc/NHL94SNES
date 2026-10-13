; Unidentified routine.
CODE_9ED8A4:
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9ED8C3
	jmp.w $D992
