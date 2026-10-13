; Unidentified routine.
GetPlayerRecord:
	lda.w #$009C
	sta.b $8B
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	ldy.w #$0000
	clc
	adc.b [$89]
	sta.b $89
	bra CODE_9FC752
