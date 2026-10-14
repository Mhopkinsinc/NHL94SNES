; Unidentified routine.
CODE_9DE0E9:
	stz.b a2
	ldx.w $0AC6
	lda.w $1C84,x
	cmp.w #$0002
	bne .rtl
	lda.w #$0002
	sta.b a2
.rtl:
	rtl
