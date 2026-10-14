; Unidentified routine.
CODE_9FCD90:
	lda.w $19D4,x
	bpl CODE_9FCDAA
	lda.w pflags,x
	bit.w #$1000
	bne CODE_9FCDAA
	lda.w $0ADD,y
	inc a
	sta.w $0ADD,y
	stx.b d0
	jsl.l CODE_9FCB68
CODE_9FCDAA:
	plx
	rtl
