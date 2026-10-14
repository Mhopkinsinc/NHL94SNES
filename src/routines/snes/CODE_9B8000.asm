; Unidentified routine.
CODE_9B8000:
	lda.w #$0000
	sta.l $7E35DA
	lda.w STAT78
	bit.w #$0010
	beq .rtl
	lda.w #$3333
	sta.l $7E35DA
.rtl:
	rtl
