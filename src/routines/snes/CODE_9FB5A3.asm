; Unidentified routine.
CODE_9FB5A3:
	ldx.b $95
	phx
	ldx.b $A9
	stx.b $95
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
	stz.b $AD
	jsl.l lcfound
	jsl.l CODE_9FD325
CODE_9FB5C9:
	plx
	stx.b $95
	rtl
