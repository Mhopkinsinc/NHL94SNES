; Unidentified routine.
SprSort:
	phx
	phy
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	ldx.w #$0000
	lda.w sfhormode
	bne CODE_9CA1C6
CODE_9CA1B7:
	lda.w Ypos,x
	sta.w Ylist,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1B7
	bra CODE_9CA1D3
