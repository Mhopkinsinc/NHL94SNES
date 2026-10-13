; Unidentified routine.
CODE_9E8D29:
	lda.w SPA,x
	cmp.w #DATA8_9DFC76
	bcs CODE_9E8D3D
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
CODE_9E8D3D:
	rtl
