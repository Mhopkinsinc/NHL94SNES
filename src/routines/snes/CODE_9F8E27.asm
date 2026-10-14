; Unidentified routine.
CODE_9F8E27:
	jsl.l CODE_9F92CB
	lda.b d1
	sta.b d3
	jsl.l NewTicker3
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E3E
	jmp.w CODE_9F9243
