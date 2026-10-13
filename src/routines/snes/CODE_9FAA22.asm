; Unidentified routine.
CODE_9FAA22:
	ldx.b $95
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w frame,x
	lda.w position,x
	sta.b $A9
	bpl CODE_9FAA3D
	jmp.w $ABA2
