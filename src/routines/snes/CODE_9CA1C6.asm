; Unidentified routine.
CODE_9CA1C6:
	lda.w Xpos,x
	sta.w Ylist,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1C6
CODE_9CA1D3:
	stz.b $AD
	ldx.w #$0000
CODE_9CA1D8:
	lda.w $15C4,x
	and.w #$00FF
	sta.b $A9
	lda.w OOlist,x
	and.w #$00FF
	sta.b $A5
	tay
	lda.w Ylist,y
	ldy.b $A9
	cmp.w Ylist,y
	bmi CODE_9CA208
	beq CODE_9CA208
	lda.w OOlist,x
	xba
	sta.w OOlist,x
	txa
	sta.w OOlistpos,y
	inc a
	ldy.b $A5
	sta.w OOlistpos,y
	inc.b $AD
CODE_9CA208:
	inx
	cpx.w #$000F
	bne CODE_9CA1D8
	lda.b $AD
	bne CODE_9CA1D3
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ply
	plx
	rtl
