; Unidentified routine.
CODE_9FE3FF:
	lda.b $A9
	bit.w #$8380
	beq CODE_9FE415
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C90,y
	eor.w #$0001
	sta.w $1C90,y
CODE_9FE415:
	jmp.w $E19E
