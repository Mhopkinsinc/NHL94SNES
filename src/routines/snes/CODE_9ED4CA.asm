; Unidentified routine.
CODE_9ED4CA:
	lda.w $1343,x
	lsr a
	clc
	adc.w $1003,x
	cmp.w #$0000
	bpl CODE_9ED4DA
	lda.w #$0000
CODE_9ED4DA:
	sta.w $1003,x
	lda.w $19D4,x
	bpl CODE_9ED514
	lda.w pucky
	sta.b d0
	lda.w Ypos,x
	eor.b d0
	sta.b d1
	bpl CODE_9ED504
	stz.b d0
	lda.w #$00F4
	sta.b d2
	lda.w pfgoal,x
	beq CODE_9ED501
	lda.w #$FF0C
	sta.b d2
CODE_9ED501:
	jmp.w CODE_9EDA51
