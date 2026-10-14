; Unidentified routine.
CODE_9FB5A3:
	ldx.b a3
	phx
	ldx.b d1
	stx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB5B6
	ldy.w #$0002
CODE_9FB5B6:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq CODE_9FB5C9
	stz.b d2
	jsl.l lcfound
	jsl.l SetLCmode2
CODE_9FB5C9:
	plx
	stx.b a3
	rtl
