; Erase the braces around the visible player-stat rows.
ClearPlayerStatBraces:
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	rtl
