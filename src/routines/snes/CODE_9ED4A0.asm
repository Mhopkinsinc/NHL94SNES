; Unidentified routine.
CODE_9ED4A0:
	lda.w $1083,x
	sec
	sbc.b d7
	sta.w $1083,x
	bpl CODE_9ED4B4
	lda.w #$0008
	sta.b d0
	jsl.l CODE_9EB88A
CODE_9ED4B4:
	lda.w $1543,x
	beq CODE_9ED4BC
	jmp.w CODE_9ED49F
