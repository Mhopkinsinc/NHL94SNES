; Unidentified routine.
CODE_9E9FA6:
	lda.b $AB
	bpl CODE_9E9FD1
	lda.b $B9
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9E9F7C
	lda.b $A5
	clc
	adc.b $A7
	sta.w Xpos,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w Ypos,y
	lda.w #$0000
	sta.w Xvel,y
	sta.w Yvel,y
	jmp.w $9D04
