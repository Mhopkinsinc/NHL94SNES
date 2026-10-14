; Z set if player X is on the shorthanded team
asspuckc:
	cpx.w puckc
	bne .1
	lda.w $19D4,x
	bmi CODE_9E82A7
.1:
	jmp.w CODE_9E8BE6

.t1:
	rtl
