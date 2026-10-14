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
	lda.b d0
	sta.w $1E31
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b d0
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
	lda.b d0
	sta.w $1E35
	ldx.w $1E25
	lda.w $1E29
	sta.b $A7
	lda.w $1E27
	sta.b d0
CODE_9C9E81:
	stx.w $1E2F
	lda.b $A7
	sta.w $1E3B
	lda.b d0
	sta.w $1E39
CODE_9C9E8E:
	plx
	inx
	lda.w $1E21
	cmp.w #$001A
	bpl .1
	cpx.w #$001A
	bmi .1
	lda.w #$0002
	sta.b a2
	jsl.l GetPlayerCount
	lda.b d0
	clc
	adc.w #$001A
	sta.w $1E21
	jsl.l GoalieCount
	lda.b d0
	clc
	adc.w #$001A
	sta.w $1E23
.1:
	cpx.w #$0034
	bpl .t1
	jmp.w CODE_9C9DA1

.t1:
	rtl
