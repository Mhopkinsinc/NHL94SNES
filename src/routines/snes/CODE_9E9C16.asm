; Unidentified routine.
CODE_9E9C16:
	lda.w Ypos,y
	cmp.w #$00F0
	bpl CODE_9E9C13
	cmp.w #$FF0A
	bmi CODE_9E9C13
	lda.b $A5
	cmp.w #$0005
	bcc CODE_9E9C0A
	lda.w #$0082
	sta.w Xpos,y
	lda.w #$0000
	sta.w Xvel,y
CODE_9E9C36:
	lda.w attribute,y
	bit.w #$0800
	bne CODE_9E9C79
CODE_9E9C3E:
	lda.w #DATA8_9DFD3A
	bra CODE_9E9C7C
