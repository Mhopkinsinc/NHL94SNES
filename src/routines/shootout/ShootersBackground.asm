; Shootout shooters: the background, the Shootout title and the team
ShootersBackground:
	lda.l $7E3468
	beq .2
	jsl.l CODE_80CB5C
.2:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #ShootoutLabel
	sta.b a1
	jsl.l PrintLetterSprites
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFA6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	lda.b a2
	beq .1
	lda.w VisTeam
	sta.b d1
.1:
	jsl.l CODE_9FBE08
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq .rtl
	jsl.l WaitFrame
	lda.w #$0050
	sta.w $1DEF
	lda.w #$0000
	sta.l $7E3468
.rtl:
	rtl
