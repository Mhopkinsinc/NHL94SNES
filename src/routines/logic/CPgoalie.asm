; Unidentified routine.
CPgoalie:
	lda.w gsp
	cmp.w #$0002
	bne CODE_9ED178
	ldy.b $8D
	lda.w tmscore,y
	ldy.b $91
	sec
	sbc.w tmscore,y
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
	sbc.b $A9
	sta.b $A9
CODE_9ED165:
	lda.b $A9
	bmi CODE_9ED178
	ldy.b $91
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jml.l setpersonel
