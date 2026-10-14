; Unidentified routine.
CODE_9ED4A0:
	lda.w $1083,x
	sec
	sbc.b d7
	sta.w $1083,x
	bpl CODE_9ED4B4
	lda.w #$0008
	sta.b d0
	jsl.l AddPenalty2
CODE_9ED4B4:
	lda.w $1543,x
	beq .t1
	jmp.w CODE_9ED49F

.t1:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi .t2
	jmp.w CODE_9EDB21

.t2:
	lda.w $1343,x
	lsr a
	clc
	adc.w $1003,x
	cmp.w #$0000
	bpl .1
	lda.w #$0000
.1:
	sta.w $1003,x
	lda.w $19D4,x
	bpl .3
	lda.w pucky
	sta.b d0
	lda.w Ypos,x
	eor.b d0
	sta.b d1
	bpl .t1x
	stz.b d0
	lda.w #$00F4
	sta.b d2
	lda.w pfgoal,x
	beq .2
	lda.w #$FF0C
	sta.b d2
.2:
	jmp.w CODE_9EDA51

.t1x:
	dec.w $1063,x
	bpl .1x
	lda.w #$FFFF
	sta.w $1063,x
.1x:
	cpx.w puckc
	beq CODE_9ED517
.3:
	jmp.w CODE_9ED5A7
