; Unidentified routine.
CODE_9FE1DD:
	bit.w #$0800
	beq CODE_9FE1FA
	dec.w $0D15
	lda.w $0D15
	cmp.w $0D13
	bpl CODE_9FE19E
	dec.w $0D13
	bpl CODE_9FE19E
	stz.w $0D13
	stz.w $0D15
	bra CODE_9FE19E
