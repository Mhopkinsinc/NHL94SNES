; Unidentified routine.
CODE_9FBAAA:
	stx.b $87
	ldx.w #$0000
CODE_9FBAAF:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0038
	bne CODE_9FBAAF
	ldx.b $87
	jsl.l show_rink
	jsl.l CODE_9FB1FD
	jsl.l CODE_9FBB01
	jsl.l CODE_9CA054
	jsl.l CODE_9FBC5F
	jsl.l CODE_9FA078
	jsl.l CODE_9FA5AD
	jsl.l CODE_9B9FAF
	jsl.l CODE_9EFA2F
	jsl.l CODE_9FBFA0
	lda.w sfhormode
	beq CODE_9FBAEC
	jsl.l CODE_9F9E24
CODE_9FBAEC:
	jsl.l CODE_9FBF75
	stx.b $87
	ldx.w #$0036
CODE_9FBAF5:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBAF5
	ldx.b $87
	ldx.b $95
	rtl
