; Unidentified routine.
CODE_9FD8D2:
	lda.w temp1,x
	adc.w #$0008
	sta.w temp1,x
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	bit.w #$8000
	beq CODE_9FD8EB
CODE_9FD8E7:
	eor.w #$FFFF
	inc a
CODE_9FD8EB:
	cmp.w #$0029
	bcc CODE_9FD8F3
	jmp.w $D99D
