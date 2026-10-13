; Unidentified routine.
CODE_9BA1B5:
	ldx.w #$0012
CODE_9BA1B8:
	stx.b $B5
	lda.l $7E340C,x
	beq CODE_9BA1C3
	jmp.w $A31C
