; Draw the scoreboard: the period and score boxes on the vertical rink, or the period, teams and scores on the horizontal rink
printscores1:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	stx.b xsave
	ldx.w #$0000
.savea:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .savea
	ldx.b xsave
	lda.w sfhormode
	beq .v
	jmp.w .sbscreen

.v:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF81C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l Framer
	lda.l $7E34BC
	cmp.w #$0004
	beq .t2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF821
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w gsp
	sta.b d0
	cmp.w #$0004
	bne .noso
	dec.w printx
	inc.b d0
.noso:
	lda.w #PerLabels>>16
	sta.b $8F
	lda.w #PerLabels
	sta.b a1
	jsl.l PrintStringFromList
	jsl.l EASNLogo
	jsl.l updatepwrplay
	bra .scores

.t2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF826
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0006
	sta.w printx
	lda.w shootoutround
	sta.b d0
	lda.w #$0002
	sta.b d1
	jsl.l PushNumberWrap
	jsl.l print
.scores:
	lda.w sflags3
	bit.w #sf3llcs
	beq .boxes
	jmp.w .ex

.boxes:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF830
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l Framer
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF835
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	stz.b d3
	stz.b a2
	jsl.l PrintTeamNameAndScore
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	inc.b d3
	inc.b a2
	inc.b a2
	jsl.l PrintTeamNameAndScore
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w gmode
	bit.w #gmdir
	bne .ends
	stz.b a3
	lda.w #$0002
	sta.b a2
.ends:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l nullrtl89
	ldx.b a2
	lda.b a3
	sta.b a2
	stx.b a3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF844
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l nullrtl89
.ex:
	stx.b xsave
	ldx.w #$000E
.resta:
	pla
	sta.b a0,x
	dex
	dex
	bpl .resta
	ldx.b xsave
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	rtl
.sbscreen:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF849
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l PrintPerLabel
	lda.b d1
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF84E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $178E
	sta.b d0
	jsl.l Mod100
	jsl.l PushNumber
	jsl.l AlignBigNumber
	jsl.l printbig
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF853
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1790
	sta.b d0
	jsl.l Mod100
	jsl.l PushNumber
	jsl.l AlignBigNumber
	jsl.l printbig
	pla
	sta.b d1
	jmp.w .ex
