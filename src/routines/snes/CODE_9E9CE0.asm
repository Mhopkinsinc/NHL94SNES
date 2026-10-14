; Unidentified routine.
CODE_9E9CE0:
	lda.w Xpos,y
	cmp.w #$0050
	bpl CODE_9E9D0A
	cmp.w #$FFB0
	bmi CODE_9E9D0A
	lda.b d0
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9E9D0D
	lda.w #$FED8
	sta.w Ypos,y
	lda.w #$0000
	sta.w $0EE3,y
CODE_9E9D04:
	lda.w #DATA8_9DFCD8
	jmp.w CODE_9E9C7C
