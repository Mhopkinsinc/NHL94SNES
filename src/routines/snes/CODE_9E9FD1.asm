; Unidentified routine.
CODE_9E9FD1:
	lda.b d5
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9E9F7C
	lda.b d0
	clc
	adc.b $A7
	sta.w Xpos,y
	lda.b d1
	clc
	adc.b $AB
	sta.w Ypos,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w CODE_9E9CDB
