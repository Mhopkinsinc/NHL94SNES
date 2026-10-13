; Unidentified routine.
GoalieCount:
	lda.b $91
	tay
	lda.w #$009C
	sta.b $C7
	lda.w tmdata,y
	sta.b $C5
	ldy.w #$000A
	clc
	adc.b [$C5],y
	sta.b $C5
	stz.b $A5
	lda.b [$C5]
	xba
CODE_9ED31A:
	inc.b $A5
	asl a
	asl a
	asl a
	asl a
	bne CODE_9ED31A
	rtl
