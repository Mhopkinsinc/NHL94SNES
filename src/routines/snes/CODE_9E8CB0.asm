; Unidentified routine.
CODE_9E8CB0:
	lda.w OOlistpos,x
	sta.b $A9
CODE_9E8CB5:
	ldy.b $A9
	cpy.w #$000F
	beq CODE_9E8CEC
	lda.w $15C4,y
	and.w #$00FF
	sta.b $B5
	tay
	lda.b $B1
	sec
	sbc.w Ylist,y
	beq CODE_9E8CEC
	bmi CODE_9E8CEC
	inc.w OOlistpos,x
	lda.w OOlistpos,y
	dec a
	sta.w OOlistpos,y
	sep #$30
	ldy.b $A9
	lda.b $B5
	sta.w OOlist,y
	txa
	sta.w $15C4,y
	rep #$30
	inc.b $A9
	bra CODE_9E8CB5
