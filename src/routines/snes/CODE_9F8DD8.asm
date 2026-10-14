; Unidentified routine.
CODE_9F8DD8:
	lda.l PassWord
	and.w #$7F7F
	sta.l PassWord
	jsl.l CODE_9BCD28
	jsl.l maketree
	lda.w #$0004
	trb.w sflags3
	beq CODE_9F8DF6
	jmp.w CODE_9F8330
