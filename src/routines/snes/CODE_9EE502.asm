; Unidentified routine.
CODE_9EE502:
	lda.w $1163,x
	sec
	sbc.w $1EAB
	beq CODE_9EE4D3
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EE51F
	jsl.l RandomWord
	and.w #$0F80
	bne CODE_9EE4D3
	bra CODE_9EE528
