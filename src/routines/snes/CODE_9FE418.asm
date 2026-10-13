; Unidentified routine.
CODE_9FE418:
	lda.b $A9
	bit.w #$8380
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C94,y
	eor.w #$0001
	sta.w $1C94,y
CODE_9FE42E:
	jmp.w $E19E
