; Line editor: the EditLinesLabel title sprites, the team name and picture; the background first when $7E3468 is set
DrawEditLinesTitle:
	lda.l $7E3468
	beq .1
	jsr.w DrawEditLinesBack
.1:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #EditLinesLabel>>16
	sta.b $8F
	lda.w #EditLinesLabel
	sta.b a1
	jsl.l PrintLetterSprites
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawEditLinesTitlePos>>16
	sta.b $8F
	lda.w #DrawEditLinesTitlePos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	lda.b a2
	beq .3
.2:
	lda.w VisTeam
	sta.b d1
	lda.w #$0030
.3:
	sta.b d0
	jsl.l DrawTeamBlocks
	jsl.l DrawMatchupPictures
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq .4
	jsl.l WaitFrame
	lda.w #$0068
	sta.w irqline2
	lda.w #$0000
	sta.l $7E3468
.4:
	jsl.l SendColours
	rtl
