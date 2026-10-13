; Unidentified routine.
CODE_8086A9:
	lda.w $0AD3
	beq CODE_8086B6
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
CODE_8086B6:
	jsl.l CODE_808684
	jmp.w CODE_8086D5
