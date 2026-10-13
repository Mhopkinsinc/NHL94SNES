; Unidentified routine.
CODE_9D87B5:
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	ldy.w #$0008
	lda.b [$89],y
	clc
	adc.b $89
	clc
	adc.w #$0004
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	rtl
