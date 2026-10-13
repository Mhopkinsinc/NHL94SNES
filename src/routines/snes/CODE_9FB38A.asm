; Unidentified routine.
CODE_9FB38A:
	lda.w gmode
	bit.w #$0040
	beq CODE_9FB396
CODE_9FB392:
	jml.l CODE_9F8CB1
