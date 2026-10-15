; Draw string a1 as letter sprites at X / Y (the PrintTeamSprites letter loop)
PrintStringSprites:
	phb
	phk
	plb
	stx.w letterx
	sty.w lettery
	stz.b $14
	lda.w #$0001
	sta.b $16
	lda.b a1
	sta.b d1
	lda.w #$FFFF
	sta.b a2
	sta.b $93
	pha
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	ldy.w #$0000
	bra PrintTeamSprites_go
