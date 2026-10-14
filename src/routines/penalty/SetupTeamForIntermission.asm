; Before a period: reset the bench, refill energy and pick each team's starting line
SetupTeamForIntermission:
	jsl.l ResetBench
	lda.w #$0001
	sta.l $7E344E
	stz.b a2
	lda.w #$0002
	sta.b a3
	jsl.l .team
	stz.b a3
	lda.w #$0002
	sta.b a2
.team:
	jsl.l reenergizeteam
	ldx.b a3
	ldy.b a2
	stz.w tmline,x
	lda.l $7E34C6
	beq .rtl
	lda.w tmap,x
	sec
	sbc.w tmap,y
	sta.b d0
	beq .rtl
	lda.w #$0003
	sta.w tmline,x
	lda.b d0
	bpl .rtl
	lda.w #$0005
	sta.w tmline,x
.rtl:
	rtl
