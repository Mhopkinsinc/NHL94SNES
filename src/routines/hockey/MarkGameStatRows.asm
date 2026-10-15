; Draw the braces around the visible game-stat rows.
MarkGameStatRows:
	lda.w listtop
	beq .1
	lda.w #$0001
	sta.w printx
	lda.w listtop
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b a1+2
	lda.w #LineBraces
	sta.b a1
	jsl.l PrintToStatsPage
.1:
	lda.w listtop
	clc
	adc.w listrows
	cmp.w listcount
	beq .2
	lda.w #$0001
	sta.w printx
	lda.w listtop
	clc
	adc.w listrows
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b a1+2
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
