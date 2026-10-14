; Unidentified routine.
CODE_9F96B8:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9F96DB
	jsl.l CODE_9B84F5
	lda.b d1
	bit.w #$1000
	beq .t1
	jmp.w CODE_9F9372

.t1:
	lda.b d1
	bne CODE_9F96DC
CODE_9F96DB:
	rtl
