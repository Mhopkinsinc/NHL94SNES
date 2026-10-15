; Play sound $0F with the velocity of the faster of players X and Y
CollisionSfx:
	phy
	ldy.w Xvel,x
	lda.w Yvel,x
	jsl.l ApproxLength
	sta.b r3
	lda.b r0+1,s
	tay
	lda.w Xvel,y
	pha
	lda.w Yvel,y
	tay
	pla
	jsl.l ApproxLength
	ply
	cmp.b r3
	bcs .t1
	lda.w Xvel,x
	sta.b p0
	lda.w Yvel,x
	sta.b p0+2
	bra .1

.t1:
	lda.w Xvel,y
	sta.b p0
	lda.w Yvel,y
	sta.b p0+2
.1:
	asl.b p0
	asl.b p0+2
	lda.w #$000F
	jsl.l sfx
	rtl
