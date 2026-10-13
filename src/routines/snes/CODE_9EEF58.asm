; Unidentified routine.
CODE_9EEF58:
	tay
	beq CODE_9EEF7E
	stz.w Xpos,x
	lda.w #$012C
	sta.w Ypos,x
	lda.w #$000E
	sta.w $0DFB
	lda.w pucky
	bpl CODE_9EEF7E
CODE_9EEF6F:
	lda.w #$8000
	sta.w attribute,x
	lda.w #$FED4
	sta.w Ypos,x
	dec.w $0DFB
CODE_9EEF7E:
	rtl
