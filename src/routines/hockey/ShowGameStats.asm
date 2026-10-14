; Game stats screen: both teams and the stat rows
ShowGameStats:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l SetupScreen
	ldx.w #$0050
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #GameStats
	sta.b a1
	jsl.l PrintLetterSprites
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF360
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF365
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F7542
	lda.w #$2BFF
	sta.l $7F7522
	jsl.l SendColours
	stz.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	lda.w #$0010
	sta.w $1DA3
	lda.w #$0010
	sta.w $1E15
	lda.l OptPen
	bne .2
.1:
	lda.w #$000B
	sta.w $1DA3
	lda.w #$0000
	sta.w $1E15
.2:
	dec.w $1DA3
	lda.w #$0060
	ldx.w #$00C8
	ldy.w #$00D8
	jsl.l SetupScrollIRQ
	lda.w #$0010
	sta.w $1DF5
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
	jsr.w PrintTeamStatRows
	jsl.l SendTextMap
	bra MarkGameStatRows
