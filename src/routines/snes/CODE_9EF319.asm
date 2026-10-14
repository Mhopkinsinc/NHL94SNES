; Unidentified routine.
CODE_9EF319:
	lda.w gmclock
	beq .t3
	stz.w $0E01
	stz.w puckvx
	stz.w puckvy
	rtl

.t3:
	lda.w $163A
	beq CODE_9EF357
	lda.w pucky
	bpl .t1
	lda.w gmode
	bit.w #$0002
	beq CODE_9EF352
	bra .t2

.t1:
	lda.w gmode
	bit.w #$0002
	beq .t2
	bra CODE_9EF352

.t2:
	lda.w $1E91
	beq CODE_9EF357
CODE_9EF34B:
	jsl.l CODE_9EC791
	jmp.w CODE_9EF5D9
