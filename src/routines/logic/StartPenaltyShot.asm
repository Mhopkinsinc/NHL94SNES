; Set a penalty shot pending for shooter $1E8D: $1E9B = 1, the shooting team $1E91 (and its count $17CA / $17CC), the shooter number ($1E8F), the scores saved ($1E97 / $1E99)
StartPenaltyShot:
	lda.w $1E9B
	bne .2
	lda.w $1E8D
	cmp.w #$000C
	bmi .t1
	lda.w #$0002
	sta.w $1E91
	inc.w tmPenShots+2
	bra .1

.t1:
	stz.w $1E91
	inc.w tmPenShots
.1:
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
.2:
	rtl
