; Unidentified routine.
CODE_9EF352:
	lda.w $1E91
	beq CODE_9EF34B
CODE_9EF357:
	jsl.l CODE_9EF213
	jsl.l freezewindow
	lda.w #$001E
	sta.w $0CA9
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pucky
	bpl CODE_9EF378
	stz.b a1
	lda.w #$0002
	sta.b a2
CODE_9EF378:
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF389
	lda.b a1
	sta.b a2
	eor.w #$0002
	sta.b a1
CODE_9EF389:
	ldy.b a2
	lda.w $178E,y
	inc a
	sta.w $178E,y
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EF3AE
	bmi CODE_9EF3A3
	ldy.b a2
	beq CODE_9EF3AE
	bra CODE_9EF3A7
