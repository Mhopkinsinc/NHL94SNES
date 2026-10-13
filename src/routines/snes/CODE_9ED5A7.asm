; Unidentified routine.
CODE_9ED5A7:
	ldy.w $19D4,x
	bmi CODE_9ED5F9
	lda.w $0ADD,y
	cmp.w #$0001
	bne CODE_9ED5F9
	cpx.w puckc
	beq CODE_9ED574
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w $0776,y
	bit.w #$4000
	bne CODE_9ED5E8
	lda.w $0AB8,y
	bit.w #$0040
	beq CODE_9ED574
	lda.w $0AA4,y
	cmp.w #$0008
	beq CODE_9ED58D
	and.w #$0007
	bra CODE_9ED593
