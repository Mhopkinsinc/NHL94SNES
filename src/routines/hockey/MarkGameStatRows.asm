; Draw the braces around the visible game-stat rows.
MarkGameStatRows:
	lda.w $1DBD
	beq .1
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces
	sta.b a1
	jsl.l PrintToStatsPage
.1:
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	beq .2
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+3
	sta.b a1
	jsl.l PrintToStatsPage
.2:
	jsr.w SendGameStatsPage
	jsl.l WaitFrame
	jmp.w GameStatsInput
; The rtl the game stats screen leaves through
GameStatsRtl:
	rtl
