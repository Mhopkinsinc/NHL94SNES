; Unidentified routine.
CODE_9B9B6B:
	lda.w gsp
	cmp.w #$0003
	beq CODE_9B9BA4
	stz.b $00
	lda.l $7E34BC
	cmp.w #$0000
	beq CODE_9B9B9B
	cmp.w #$0004
	beq CODE_9B9B9B
	inc.b $00
	lda.l $7E35D4
	cmp.w #$0002
	bmi CODE_9B9B9B
	inc.b $00
	lda.l $7E35D4
	cmp.w #$0003
	bmi CODE_9B9B9B
	inc.b $00
CODE_9B9B9B:
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	sta.w $19BE
CODE_9B9BA4:
	rtl
