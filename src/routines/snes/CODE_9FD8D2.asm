; Unidentified routine.
CODE_9FD8D2:
	lda.w $1003,x
	adc.w #$0008
	sta.w $1003,x
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	bit.w #$8000
	beq CODE_9FD8EB
CODE_9FD8E7:
	eor.w #$FFFF
	inc a
CODE_9FD8EB:
	cmp.w #$0029
	bcc CODE_9FD8F3
	jmp.w CODE_9FD99D
