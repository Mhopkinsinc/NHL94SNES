; Erase the braces around the visible other-scores rows.
ClearOtherScoreBraces:
	lda.w #$0004
	sta.w printx
	lda.w listtop
	asl a
	adc.w listtop
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b a1+2
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	lda.w #$0004
	sta.w printx
	lda.w listtop
	clc
	adc.w listrows
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b a1+2
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	rts
