; Unidentified routine.
CODE_9EF352:
	lda.w $1E91
	beq CODE_9EF34B
CODE_9EF357:
	jsl.l CODE_9EF213
	jsl.l CODE_9FBA97
	lda.w #$001E
	sta.w $0CA9
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w pucky
	bpl CODE_9EF378
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9EF378:
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF389
	lda.b $8D
	sta.b $91
	eor.w #$0002
	sta.b $8D
CODE_9EF389:
	ldy.b $91
	lda.w tmscore,y
	inc a
	sta.w tmscore,y
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EF3AE
	bmi CODE_9EF3A3
	ldy.b $91
	beq CODE_9EF3AE
	bra CODE_9EF3A7
