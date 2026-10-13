; Unidentified routine.
CODE_9B9300:
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$0008
	clc
	adc.b [$95],y
	clc
	adc.w #$0003
	sta.b $95
	lda.b [$95]
	and.w #$000F
	sta.b $A5
	rtl
