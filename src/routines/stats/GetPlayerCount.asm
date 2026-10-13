; Unidentified routine.
GetPlayerCount:
	lda.b $89
	pha
	lda.b $8B
	pha
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	ldy.w #$0000
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	stz.b $A5
CODE_9FC95B:
	inc.b $A5
	lda.b [$89]
	clc
	adc.b $89
	adc.w #$0008
	sta.b $89
	lda.b [$89]
	cmp.w #$0002
	bne CODE_9FC95B
	pla
	sta.b $8B
	pla
	sta.b $89
	rtl
