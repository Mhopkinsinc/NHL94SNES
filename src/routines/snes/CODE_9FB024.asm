; Unidentified routine.
CODE_9FB024:
	sty.b $B5
	jsl.l CODE_9FCD2A
CODE_9FB02A:
	plx
	ldy.w $1E91
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9FB046
	sta.w $19BE
CODE_9FB046:
	lda.w $1E8D
	sta.w $0AD9
	tay
	lda.w $1E93
	bmi CODE_9FB055
	sta.w $19D4,y
CODE_9FB055:
	stz.w $163A
	inc.w $163A
	lda.w #$0001
	sta.w $1E9D
	lda.w #$03E8
	sta.w $1E9F
	jsl.l ClearPenaltyBuffer
	rtl
