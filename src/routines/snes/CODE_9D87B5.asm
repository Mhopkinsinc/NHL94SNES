; Unidentified routine.
CODE_9D87B5:
	ldy.b a2
	lda.w tmdata,y
	sta.b a0
	lda.w #$009C
	sta.b $8B
	ldy.w #$0008
	lda.b [a0],y
	clc
	adc.b a0
	clc
	adc.w #$0004
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	sta.b d0
	rtl
