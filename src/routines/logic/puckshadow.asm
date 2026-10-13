; Unidentified routine.
puckshadow:
	lda.w frame,x
	cmp.w #$018C
	bne CODE_9EEF58
	lda.w puckx
	sta.w Xpos,x
	lda.w pucky
	sta.w Ypos,x
	stz.w $0DFB
	lda.w sfhormode
	beq CODE_9EEF54
	inc.w Xpos,x
	rtl
