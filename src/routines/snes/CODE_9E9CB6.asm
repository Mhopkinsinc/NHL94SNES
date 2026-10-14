; Unidentified routine.
CODE_9E9CB6:
	lda.w Xpos,y
	cmp.w #$0050
	bpl CODE_9E9D0A
	cmp.w #$FFB0
	bmi CODE_9E9D0A
	lda.b d0
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9E9D0D
	lda.w #$0128
	sta.w Ypos,y
	lda.w #$0000
	sta.w $0EE3,y
CODE_9E9CDB:
	lda.w #DATA8_9DFC76
	bra CODE_9E9C7C
