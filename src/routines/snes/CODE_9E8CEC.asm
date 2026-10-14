; Unidentified routine.
CODE_9E8CEC:
	lda.w OOlistpos,x
	beq CODE_9E8D23
	sta.b d1
CODE_9E8CF3:
	ldy.b d1
	lda.w $15C2,y
	and.w #$00FF
	sta.b d4
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	bpl CODE_9E8D23
	dec.w OOlistpos,x
	lda.w OOlistpos,y
	inc a
	sta.w OOlistpos,y
	sep #$30
	ldy.b d1
	lda.b d4
	sta.w OOlist,y
	txa
	sta.w $15C2,y
	rep #$30
	dec.b d1
	bne CODE_9E8CF3
CODE_9E8D23:
	lda.b d3
	sta.w Ylist,x
	rtl
