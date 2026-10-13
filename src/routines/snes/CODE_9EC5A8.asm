; Unidentified routine.
CODE_9EC5A8:
	lda.w pfgoal,y
	beq CODE_9EC590
CODE_9EC5AD:
	tya
	lsr a
	xba
	sta.w iflags
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,y
	beq CODE_9EC5CB
	lda.w #$0002
	tsb.w iflags
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC5CB:
	lda.b $A5
	bmi CODE_9EC5A7
	lda.w tmap
	sec
	sbc.w $17A8
	sta.b $A5
	lda.w pfteam,y
	beq CODE_9EC5E5
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC5E5:
	lda.b $A5
	bmi CODE_9EC5A7
	lda.w #$0004
	tsb.w iflags
	rtl
