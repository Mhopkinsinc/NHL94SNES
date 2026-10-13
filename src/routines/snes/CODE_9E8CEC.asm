; Unidentified routine.
CODE_9E8CEC:
	lda.w OOlistpos,x
	beq CODE_9E8D23
	sta.b $A9
CODE_9E8CF3:
	ldy.b $A9
	lda.w $15C2,y
	and.w #$00FF
	sta.b $B5
	tay
	lda.b $B1
	sec
	sbc.w Ylist,y
	bpl CODE_9E8D23
	dec.w OOlistpos,x
	lda.w OOlistpos,y
	inc a
	sta.w OOlistpos,y
	sep #$30
	ldy.b $A9
	lda.b $B5
	sta.w OOlist,y
	txa
	sta.w $15C2,y
	rep #$30
	dec.b $A9
	bne CODE_9E8CF3
CODE_9E8D23:
	lda.b $B1
	sta.w Ylist,x
	rtl
