; Unidentified routine.
CODE_9FB3AA:
	lda.w gmode
	bit.w #$0008
	beq CODE_9FB3B6
CODE_9FB3B2:
	jml.l CODE_9EB2C9
