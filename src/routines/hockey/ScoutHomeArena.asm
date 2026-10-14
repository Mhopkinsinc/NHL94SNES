; Script code %r: the home arena (the fourth team String)
ScoutHomeArena:
	lda.w tmdata
	sta.b a1
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b a1
	clc
	adc.b [a1],y
	sta.b a1
	lda.b d0
	pha
	lda.w #$0003
	sta.b d0
	jsl.l AdvanceStringPtr
	pla
	sta.b d0
	jmp.w ScoutAppend
