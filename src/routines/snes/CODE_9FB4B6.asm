; Unidentified routine.
CODE_9FB4B6:
	ldy.b a3
	sty.b a2
	lda.b d0
	asl a
	sta.b d0
	sta.b a3
	tax
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1
	ldy.w #$0002
.1:
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FD2FE
	ply
	sty.b a2
	ldx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .2
	ldy.w #$0002
.2:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq CODE_9FB50F
	lda.w pfteam,x
	beq .t1
	lda.w #$0168
	sta.w $1023,y
	txa
	lsr a
	sta.w $1063,y
	bra CODE_9FB50F

.t1:
	lda.w #$0258
	sta.w $1003,y
	txa
	lsr a
	sta.w $1043,y
CODE_9FB50F:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
CODE_9FB517:
	rtl
