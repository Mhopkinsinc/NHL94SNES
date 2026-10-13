; Unidentified routine.
CODE_9EE635:
	lda.w Xpos,x
	cmp.w #$0020
	bpl CODE_9EE690
	cmp.w #$FFE0
	bmi CODE_9EE690
	jsl.l RandomWord
	and.w #$00C0
	beq CODE_9EE655
	lda.w attribute,x
	bit.w #$0800
	bne CODE_9EE666
	bra CODE_9EE66B
