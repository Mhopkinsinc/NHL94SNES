; Unidentified routine.
CODE_9FAA22:
	ldx.b a3
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w $0D97,x
	lda.w position,x
	sta.b d1
	bpl CODE_9FAA3D
	jmp.w CODE_9FABA2
