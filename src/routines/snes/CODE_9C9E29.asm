; Unidentified routine.
CODE_9C9E29:
	lda.w $1E2B
	sta.w $1E25
	lda.w $1E33
	sta.w $1E29
	lda.w $1E31
	sta.w $1E27
	stx.w $1E2B
	lda.b $A7
	sta.w $1E33
	lda.b $A5
	sta.w $1E31
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b $A5
CODE_9C9E55:
	lda.w $1E2D
	sta.w $1E25
	lda.w $1E37
	sta.w $1E29
	lda.w $1E35
	sta.w $1E27
	stx.w $1E2D
	lda.b $A7
	sta.w $1E37
	lda.b $A5
	sta.w $1E35
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b $A5
CODE_9C9E81:
	stx.w $1E2F
	lda.b $A7
	sta.w $1E3B
	lda.b $A5
	sta.w $1E39
CODE_9C9E8E:
	plx
	inx
	lda.w $1E21
	cmp.w #$001A
	bpl CODE_9C9EBC
	cpx.w #$001A
	bmi CODE_9C9EBC
	lda.w #$0002
	sta.b $91
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$001A
	sta.w $1E21
	jsl.l GoalieCount
	lda.b $A5
	clc
	adc.w #$001A
	sta.w $1E23
CODE_9C9EBC:
	cpx.w #$0034
	bpl CODE_9C9EC4
	jmp.w CODE_9C9DA1
