; Unidentified routine.
CODE_9B9300:
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$0008
	clc
	adc.b [a3],y
	clc
	adc.w #$0003
	sta.b a3
	lda.b [a3]
	and.w #$000F
	sta.b d0
	rtl
