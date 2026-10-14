; Unidentified routine.
CODE_9FE3BA:
	jsl.l CODE_9FC76C
	jsl.l GoalieCount
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.b d1
	bit.w #$8180
	bne CODE_9FE3EB
	bit.w #$0200
	bne CODE_9FE3D7
	jmp.w CODE_9FE19E
