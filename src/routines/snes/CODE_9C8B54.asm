; Unidentified routine.
CODE_9C8B54:
	lda.w #$0000
	ldy.w #$FFFF
CODE_9C8B5A:
	iny
	sep #$20
	sta.w $1DFB,y
	rep #$20
	inc a
	cpy.w $1DC1
	bcc CODE_9C8B5A
	rtl
