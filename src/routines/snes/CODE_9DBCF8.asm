; Unidentified routine.
CODE_9DBCF8:
	stz.w $0BD5
	ldx.w #$0000
	lda.w #$0000
CODE_9DBD01:
	jsl.l RandomWord
	and.w #$001F
	cmp.w #$001A
	bcs CODE_9DBD01
	phx
	ldx.w #$0000
CODE_9DBD11:
	cpx.w $0BD5
	bcs CODE_9DBD23
	cmp.l $7EF000,x
	beq CODE_9DBD20
	inx
	inx
	bra CODE_9DBD11
