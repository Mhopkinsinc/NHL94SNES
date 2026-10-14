; Unidentified routine.
CODE_9CA1C6:
	lda.w Xpos,x
	sta.w Ylist,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1C6
CODE_9CA1D3:
	stz.b d2
	ldx.w #$0000
CODE_9CA1D8:
	lda.w $15C4,x
	and.w #$00FF
	sta.b d1
	lda.w OOlist,x
	and.w #$00FF
	sta.b d0
	tay
	lda.w Ylist,y
	ldy.b d1
	cmp.w Ylist,y
	bmi CODE_9CA208
	beq CODE_9CA208
	lda.w OOlist,x
	xba
	sta.w OOlist,x
	txa
	sta.w OOlistpos,y
	inc a
	ldy.b d0
	sta.w OOlistpos,y
	inc.b d2
CODE_9CA208:
	inx
	cpx.w #$000F
	bne CODE_9CA1D8
	lda.b d2
	bne CODE_9CA1D3
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ply
	plx
	rtl
