; Unidentified routine.
CODE_9E8A40:
	lda.w #$0108
	sta.b d2
	sec
	sbc.w pucky
	bpl CODE_9E8A4F
CODE_9E8A4B:
	lda.b d2
	sta.b d1
CODE_9E8A4F:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b a0
	lda.w $0D71
	eor.b d0
	sta.b d2
	bmi CODE_9E8A67
	lda.w $0D71
	sta.b d0
CODE_9E8A67:
	jmp.w CODE_9EA5A4
	cpx.w $0AD9
	beq CODE_9E8A88
	ldy.w $0AD9
	bmi CODE_9E8A90
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8A90
	lda.w #$0003
	sta.b d0
	jmp.w assreplace
