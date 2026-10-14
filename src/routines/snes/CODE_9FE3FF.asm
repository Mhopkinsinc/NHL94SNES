; Unidentified routine.
CODE_9FE3FF:
	lda.b d1
	bit.w #$8380
	beq CODE_9FE415
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C90,y
	eor.w #$0001
	sta.w $1C90,y
CODE_9FE415:
	jmp.w CODE_9FE19E
