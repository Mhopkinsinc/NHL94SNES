; Player stats: print the column name, sort the player order ($1DFB) by stat column $1DF9 (ComparePlayerStats), then FillPlayerStatsPage
SortPlayerStats:
	lda.w statcolumn
	sta.b d0
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #SortPlayerStatsPos>>16
	sta.b $8F
	lda.w #SortPlayerStatsPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #StatColumnNames>>16
	sta.b $8F
	lda.w #StatColumnNames
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l print
	ldx.w listtop
.loop:
	txy
.loop2:
	iny
	jsl.l ComparePlayerStats
	lda.w statstemp
	beq .2
.1:
	sep #$20
	lda.w statsorder,y
	sta.w statstemp
	lda.w statsorder,x
	sta.w statsorder,y
	lda.w statstemp
	sta.w statsorder,x
	rep #$20
.2:
	cpy.w listend
	bcc .loop2
	inx
	cpx.w listend
	bcc .loop
	jsl.l FillPlayerStatsPage
	rtl
