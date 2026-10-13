; Unidentified routine.
CODE_9D9AA8:
	cmp.w #$0020
	beq CODE_9D9ABE
	cmp.w #$002E
	bne CODE_9D9AB7
	lda.w #$001A
	bra CODE_9D9ABE
