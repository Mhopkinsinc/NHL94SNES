; Unidentified routine.
CODE_9E8CB0:
	lda.w OOlistpos,x
	sta.b d1
CODE_9E8CB5:
	ldy.b d1
	cpy.w #$000F
	beq CODE_9E8CEC
	lda.w $15C4,y
	and.w #$00FF
	sta.b d4
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	beq CODE_9E8CEC
	bmi CODE_9E8CEC
	inc.w OOlistpos,x
	lda.w OOlistpos,y
	dec a
	sta.w OOlistpos,y
	sep #$30
	ldy.b d1
	lda.b d4
	sta.w OOlist,y
	txa
	sta.w $15C4,y
	rep #$30
	inc.b d1
	bra CODE_9E8CB5
