; Should the computer pull its goalie in the last minute of the third period when it is behind
CPgoalie:
	lda.w gsp
	cmp.w #$0002
	bne CODE_9ED178
	ldy.b a1
	lda.w $178E,y
	ldy.b a2
	sec
	sbc.w $178E,y
	bmi CODE_9ED178
	beq CODE_9ED178
	cmp.w #$0003
	bcs CODE_9ED178
	lda.w gameclock
	cmp.w #$003D
	bcs CODE_9ED178
	lda.w tmsort,y
	tay
	lda.w pfgoal,y
	bne CODE_9ED165
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9ED165:
	lda.b d1
	bmi CODE_9ED178
	ldy.b a2
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jml.l setpersonel
