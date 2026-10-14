; Unidentified routine.
CODE_9E92AE:
	lda.w $0E01
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sta.w $0E01
	rtl
