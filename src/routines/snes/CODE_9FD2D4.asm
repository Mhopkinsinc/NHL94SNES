; Unidentified routine.
CODE_9FD2D4:
	lda.w #$EA1A
CODE_9FD2D7:
	jsl.l CODE_9EA3F1
	stz.w $0F23,x
	stz.w $1203,x
	lda.w pflags,x
	and.w #$FFF6
	sta.w pflags,x
	stz.w $1563,x
	stz.w $1523,x
	stz.w $14E3,x
CODE_9FD2F3:
	inc.b $95
	inc.b $95
	ldx.b $95
	dec.b $AD
	bpl CODE_9FD2BC
	rtl
