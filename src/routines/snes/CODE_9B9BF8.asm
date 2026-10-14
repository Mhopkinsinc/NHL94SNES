; Unidentified routine.
CODE_9B9BF8:
	lda.b d0
	pha
	jsl.l CODE_9B9BA5
	lda.b d0
	sta.w $19C2
	cmp.w #$0069
	bmi .t1
	cmp.w #$006E
	bmi CODE_9B9C22
	lda.w #$0001
	sta.w $19C0
	bra CODE_9B9C22

.t1:
	lda.w $19C0
	beq CODE_9B9C22
	jsl.l CODE_9BA89F
	stz.w $19C0
CODE_9B9C22:
	pla
	sta.b d0
	rtl
