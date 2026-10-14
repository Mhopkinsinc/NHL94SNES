; Unidentified routine.
CODE_9EE797:
	lda.w SPA,x
	cmp.w #$EF6E
	beq CODE_9EE7F6
	cmp.w #$F020
	beq CODE_9EE7F6
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9EE7B0
	ldy.w #$0002
CODE_9EE7B0:
	lda.w $17D2,y
	inc a
	sta.w $17D2,y
	ply
	lda.w #$0000
	sec
	sbc.w $0BA7
	sta.b d0
	lda.w pfgoal,x
	bne CODE_9EE7D1
	lda.w #$FEF8
	sec
	sbc.w $0BA9
	sta.b d1
	bra CODE_9EE7DA
