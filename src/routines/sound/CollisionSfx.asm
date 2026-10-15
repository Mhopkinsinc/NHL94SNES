; Play sound $0F with the velocity of the faster of players X and Y
CollisionSfx:
	phy
	ldy.w Xvel,x
	lda.w Yvel,x
	jsl.l ApproxLength
	sta.b $14
	lda.b $01,s
	tay
	lda.w Xvel,y
	pha
	lda.w Yvel,y
	tay
	pla
	jsl.l ApproxLength
	ply
	cmp.b $14
	bcs .t1
	lda.w Xvel,x
	sta.b $0C
	lda.w Yvel,x
	sta.b $0E
	bra .1

.t1:
	lda.w Xvel,y
	sta.b $0C
	lda.w Yvel,y
	sta.b $0E
.1:
	asl.b $0C
	asl.b $0E
	lda.w #$000F
	jsl.l sfx
	rtl
