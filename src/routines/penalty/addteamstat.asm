; Add d0 to a team stat for player X's team
addteamstat:
	ldy.b d1
	lda.w pfteam,x
	beq .add
	iny
	iny
.add:
	lda.w $0000,y
	clc
	adc.b d0
	sta.w $0000,y
	rtl
