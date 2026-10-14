; Unidentified routine.
CODE_9EE5E6:
	lda.b d0
	cmp.w #$002C
	bpl CODE_9EE635
	jsl.l RandomWord
	and.w #$00C0
	beq CODE_9EE600
	lda.w attribute,x
	bit.w #$0800
	bne CODE_9EE611
	bra CODE_9EE616
