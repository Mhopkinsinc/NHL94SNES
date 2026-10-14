; Unidentified routine.
CODE_9E8A40:
	lda.w #$0108
	sta.b $AD
	sec
	sbc.w pucky
	bpl CODE_9E8A4F
CODE_9E8A4B:
	lda.b $AD
	sta.b $A9
CODE_9E8A4F:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	lda.w $0D71
	eor.b $A5
	sta.b $AD
	bmi CODE_9E8A67
	lda.w $0D71
	sta.b $A5
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
	sta.b $A5
	jmp.w assreplace
