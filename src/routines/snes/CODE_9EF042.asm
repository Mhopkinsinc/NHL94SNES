; Unidentified routine.
CODE_9EF042:
	lda.w gmode
	bit.w #$0010
	beq CODE_9EF04D
	jmp.w $F1CA
