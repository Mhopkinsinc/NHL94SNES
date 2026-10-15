; Erase the braces around the visible game-stat rows.
ClearGameStatBraces:
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l PrintToStatsPage
	rts

SendGameStatsPage:
	lda.w $1DBD
	xba
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w $1DC5
	inc a
	xba
	lsr a
	tax
	ldy.w #$0180
	jsl.l DMAToVRAM
	rts
