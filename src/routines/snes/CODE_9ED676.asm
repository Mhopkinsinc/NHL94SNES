; Unidentified routine.
CODE_9ED676:
	jsl.l vtoa
	lda.b d0
CODE_9ED67C:
	sta.w facedir,x
	ldy.w #$E4B6
	tya
	jsl.l CODE_9EA3F1
	lda.w #$0168
	sta.w $0BEB,x
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9ED699
	sta.w $19BE
CODE_9ED699:
	lda.w #$0096
	sta.w pfalock,x
	clc
	adc.l $7E35E0
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
	rtl
