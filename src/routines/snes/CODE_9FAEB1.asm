; Unidentified routine.
CODE_9FAEB1:
	lda.b d7
	sta.b tmp0
	cmp.w $1003,x
	bmi .1
	lda.w #$0001
	sta.b tmp0
.1:
	lda.w $1003,x
	sec
	sbc.b tmp0
	sta.w $1003,x
	bpl updatefaceoff
	lda.w $1E9B
	beq .t1
	jsl.l CODE_9FB092
	jmp.w CODE_9FAFBE

.t1:
	stz.w $163A
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w CODE_9FB092
