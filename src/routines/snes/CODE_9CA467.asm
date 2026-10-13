; Unidentified routine.
CODE_9CA467:
	cmp.w #$0200
	bne CODE_9CA49F
	lda.l $7E3508
	and.w #$01FF
	sta.b $A5
	sep #$30
	phx
	phy
	clc
	ldx.b #$0E
	lda.l $7E3517
	sta.b $14
CODE_9CA482:
	ldy.b $14
	lda.l $7E3508,x
	sta.b $14
	tya
	ror a
	sta.l $7E3508,x
	dex
	bpl CODE_9CA482
	lda.b #$00
	sta.l $7E3517
	ply
	plx
	rep #$30
	clc
	rtl
