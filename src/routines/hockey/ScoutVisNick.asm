; Script code %m: the visitors nickname (the third team String)
ScoutVisNick:
	lda.w $1CDE
	sta.b a1
	bra ScoutTeamNick

ScoutHomeNick:
	lda.w tmdata
	sta.b a1
ScoutTeamNick:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b a1
	clc
	adc.b [a1],y
	sta.b a1
	lda.b d0
	pha
	lda.w #$0002
	sta.b d0
	jsl.l AdvanceStringPtr
	pla
	sta.b d0
	jmp.w ScoutAppend
