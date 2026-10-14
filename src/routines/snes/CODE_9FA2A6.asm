; Unidentified routine.
CODE_9FA2A6:
	jsl.l SetupTeamForIntermission
	lda.w #$0000
	ldy.w #$001E
.loop:
	sta.w Xpos,y
	dey
	dey
	bpl .loop
	lda.b $83
	ldy.b $85
	sta.w $0D51
	sty.w $0D53
	lda.w #$0001
	trb.w sflags
	lda.w gsp
	cmp.w #$0004
	beq .t1
	bra .t1

.t1:
	lda.w #$0708
	sta.w $0CE3
	lda.w #$0001
	sta.w $0D2F
	lda.b $83
	sec
	sbc.w #$0150
	sta.w $0D33
	jsl.l CODE_9FA37A
	lda.w $0D31
	sta.l $7E35DC
	stz.w $0D13
	stz.w $0D15
	lda.w #$FFFF
	sta.w $0AC6
	ldy.w #$FFFE
.loopx:
	iny
	iny
	cpy.w #$000A
	bcs .1
	lda.w $1C84,y
	beq .loopx
	eor.w #$FFFF
	inc a
	sta.w $0AC6
.1:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne .2
	stz.w $0AC6
.2:
	lda.w #$0001
	sta.w $1A10
.loop2:
	lda.w #$0000
	ldy.w #$001E
.loop3:
	sta.w Xpos,y
	dey
	dey
	bpl .loop3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F862
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	jsl.l printscores1
	jsl.l PauseMenu
	bne .loop2
	lda.w #$0000
	sta.l $7E3476
	stz.w $1A10
	stz.w $0D2F
CODE_9FA379:
	rtl
