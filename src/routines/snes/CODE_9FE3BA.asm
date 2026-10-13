; Unidentified routine.
CODE_9FE3BA:
	jsl.l CODE_9FC76C
	jsl.l GoalieCount
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.b $A9
	bit.w #$8180
	bne CODE_9FE3EB
	bit.w #$0200
	bne CODE_9FE3D7
	jmp.w $E19E
