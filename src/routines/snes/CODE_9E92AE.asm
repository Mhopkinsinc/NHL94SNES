; Unidentified routine.
CODE_9E92AE:
	lda.w $0E01
	bit.w #$8000
	beq CODE_9E92BA
	eor.w #$FFFF
	inc a
CODE_9E92BA:
	sta.w $0E01
	rtl
