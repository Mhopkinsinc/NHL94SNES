; At a period start (not overtime): CwdExciteLvl = $10 per playoff stage (0 outside the playoffs)
InitCrowdExcite:
	lda.w gsp
	cmp.w #$0003
	beq .rtl
	stz.b $00
	lda.l OptPlayMode
	cmp.w #$0000
	beq .1
	cmp.w #$0004
	beq .1
	inc.b $00
	lda.l playoffRoundIdx
	cmp.w #$0002
	bmi .1
	inc.b $00
	lda.l playoffRoundIdx
	cmp.w #$0003
	bmi .1
	inc.b $00
.1:
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	sta.w CwdExciteLvl
.rtl:
	rtl
