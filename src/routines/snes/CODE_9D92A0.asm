; Unidentified routine.
CODE_9D92A0:
	lda.b $B3
	bmi CODE_9D930D
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$002F
	cmp.w #$0080
	bcc CODE_9D92B6
	jmp.w $936E
