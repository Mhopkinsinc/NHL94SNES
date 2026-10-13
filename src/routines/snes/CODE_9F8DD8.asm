; Unidentified routine.
CODE_9F8DD8:
	lda.l $7E34F4
	and.w #$7F7F
	sta.l $7E34F4
	jsl.l CODE_9BCD28
	jsl.l CODE_9D9783
	lda.w #$0004
	trb.w sflags3
	beq CODE_9F8DF6
	jmp.w $8330
