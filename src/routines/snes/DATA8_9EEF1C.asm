; Unidentified routine.
DATA8_9EEF1C:
	dw -105,-115,-115,-180,-215,-180,105,115,115,180,215,180
	lda.w $0D97,x
	cmp.w #$018C
	bne CODE_9EEF58
	lda.w $0D71
	sta.w Xpos,x
	lda.w pucky
	sta.w Ypos,x
	stz.w $0DFB
	lda.w sfhormode
	beq CODE_9EEF54
	inc.w Xpos,x
	rtl
