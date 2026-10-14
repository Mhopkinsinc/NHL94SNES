; Unidentified routine.
CODE_9EC72D:
	lda.w $1E9B
	bne CODE_9EC790
	lda.w $1E8D
	cmp.w #$000C
	bmi .t1
	lda.w #$0002
	sta.w $1E91
	inc.w $17CC
	bra CODE_9EC74B

.t1:
	stz.w $1E91
	inc.w $17CA
CODE_9EC74B:
	phy
	lda.w $1E91
	eor.w #$0002
	tay
	lda.w #$0001
	sta.w tmap,y
	ldy.w $1E91
	lda.w #$0001
	sta.w tmap,y
	ply
	phx
	ldx.w $1E8D
	lda.w pnum,x
	sta.w $1E8F
	plx
	stz.w $1E9B
	inc.w $1E9B
	lda.l $7E3136
	sta.w $1E97
	lda.l $7E3138
	sta.w $1E99
	lda.w #$0000
	sta.l $7E3136
	lda.w #$0000
	sta.l $7E3138
CODE_9EC790:
	rtl
