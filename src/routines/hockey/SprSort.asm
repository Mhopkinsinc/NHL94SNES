; Sort the objects by screen position for drawing
SprSort:
	phx
	phy
	lda.b d0
	pha
	lda.b d0+2
	pha
	lda.b d1
	pha
	lda.b d1+2
	pha
	lda.b d2
	pha
	lda.b d2+2
	pha
	ldx.w #$0000
	lda.w sfhormode
	bne CODE_9CA1C6
.loop0:
	lda.w Ypos,x
	sta.w Ylist,x
	inx
	inx
	cpx.w #$0020
	bne .loop0
	bra CODE_9CA1D3
