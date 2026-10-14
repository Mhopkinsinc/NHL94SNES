; Unidentified routine.
CODE_9ED44E:
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9ED41E
	bit.w #$0002
	bne CODE_9ED421
	ldy.w $19D4,x
	lda.w $0AA4,y
	cmp.w #$0008
	bne CODE_9ED46A
	jsl.l StopNA
CODE_9ED46A:
	lda.w $1543,x
	bne .1
	lda.w #SPAgready
	jsl.l SetSPAFromA
.1:
	lda.w gmclock
	bne CODE_9ED49F
	lda.w $1083,x
	bmi CODE_9ED4B4
	cpx.w puckc
	bne .t1
	lda.w Ypos,x
	cmp.w #$00BB
	bpl CODE_9ED4A0
	cmp.w #$FF45
	bmi CODE_9ED4A0
	stz.w $1083,x
	bra CODE_9ED4A0

.t1:
	lda.w #$FFFF
	sta.w $1083,x
	bra CODE_9ED4B4
