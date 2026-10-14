; Player stats: print the column name, sort the player order ($1DFB) by stat column $1DF9 (ComparePlayerStats), then FillPlayerStatsPage
SortPlayerStats:
	lda.w $1DF9
	sta.b d0
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #SortPlayerStatsPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$009C
	sta.b $8F
	lda.w #StatColumnNames
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l print
	ldx.w $1DBD
.loop:
	txy
.loop2:
	iny
	jsl.l ComparePlayerStats
	lda.w $1DC9
	beq .2
.1:
	sep #$20
	lda.w $1DFB,y
	sta.w $1DC9
	lda.w $1DFB,x
	sta.w $1DFB,y
	lda.w $1DC9
	sta.w $1DFB,x
	rep #$20
.2:
	cpy.w $1DC1
	bcc .loop2
	inx
	cpx.w $1DC1
	bcc .loop
	jsl.l FillPlayerStatsPage
	rtl
