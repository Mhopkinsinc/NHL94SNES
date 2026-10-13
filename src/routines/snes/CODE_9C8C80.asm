; Unidentified routine.
CODE_9C8C80:
	sep #$20
	lda.w $18EE,y
	cmp.w $18EE,x
	rep #$20
	beq CODE_9C8D03
CODE_9C8C8C:
	bpl CODE_9C8D0B
	jmp.w $8D03
