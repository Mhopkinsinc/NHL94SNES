; Unidentified routine.
CODE_9FDAC6:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FDAD7
	lda.w $19EC,y
	bmi CODE_9FDAD7
	jmp.w $DB5E
