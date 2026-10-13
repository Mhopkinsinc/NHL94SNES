; Unidentified routine.
CODE_9FB4B6:
	ldy.b $95
	sty.b $91
	lda.b $A5
	asl a
	sta.b $A5
	sta.b $95
	tax
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB4CE
	ldy.w #$0002
CODE_9FB4CE:
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FD2FE
	ply
	sty.b $91
	ldx.b $95
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB4E9
	ldy.w #$0002
CODE_9FB4E9:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq CODE_9FB50F
	lda.w pfteam,x
	beq CODE_9FB504
	lda.w #$0168
	sta.w $1023,y
	txa
	lsr a
	sta.w $1063,y
	bra CODE_9FB50F
