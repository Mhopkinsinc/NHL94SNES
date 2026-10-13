; Unidentified routine.
CODE_9B9C16:
	lda.w $19C0
	beq CODE_9B9C22
	jsl.l CODE_9BA89F
	stz.w $19C0
CODE_9B9C22:
	pla
	sta.b $A5
	rtl
