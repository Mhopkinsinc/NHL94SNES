; Unidentified routine.
CODE_9E9F7F:
	lda.b $B9
	cmp.w #$0005
	bcc CODE_9E9F7C
	lda.b $A5
	sec
	sbc.w #$0006
	clc
	adc.b $A7
	sta.w Xpos,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w Ypos,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w CODE_9E9C36
