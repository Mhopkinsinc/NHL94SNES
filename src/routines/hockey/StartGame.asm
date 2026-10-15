; Reset the game state for a new game, then start the first period
StartGame:
	jsl.l PlayoffScreen
StartGame_scout:
	jsl.l Create_HotCold_Table
	jsl.l ScoutingReport
StartGame_go:
	lda.w #$FFFF
	sta.w FrameByNumber
	jsl.l FadeOut
	ldx.w #$0AD7
	lda.w #$0000
.loop:
	sta.b $00,x
	inx
	cpx.w #$1A11
	bne .loop
	ldx.w #$30F4
.loop2:
	sta.l $7E0000,x
	inx
	cpx.w #$3479
	bne .loop2
	lda.l $7E347A
	inc a
	sta.l $7E347A
	stz.w gmode
	lda.l OptPen
	cmp.w #$0001
	bne .1
	lda.w #$0020
	tsb.w gmode
.1:
	jsl.l ClearTeamStats
	jsl.l restoreteams
	jsl.l InitScores
	lda.w #$007E
	sta.w ReplayBufferPtr+2
	lda.w #$577E
	sta.w ReplayBufferPtr
	lda.w #$0010
	trb.w sflags
	lda.b a2
	pha
	lda.w #$0000
	sta.b a2
	jsl.l LoadTeamLines
	lda.w #$0002
	sta.b a2
	jsl.l LoadTeamLines
	pla
	sta.b a2
	lda.l $7E34C8
	sta.w goaliemode1
	sta.w goaliemode2
	lda.w #$0001
	sta.w tmtimeouts
	sta.w tmtimeouts+2
	stz.w penshot
	stz.w penshotlive
	stz.w lastperiod
	lda.w #$0001
	sta.l $7E344E
	stz.w teampads
	stz.w teampads+2
	ldx.w #$0008
.2:
	lda.w cont1team,x
	cmp.w #$0001
	bne .t1
	inc.w teampads
	bra .3

.t1:
	cmp.w #$0002
	bne .3
	inc.w teampads+2
.3:
	dex
	dex
	bpl .2
	jsl.l setupice
	stz.w pregamepause
	ldx.w #$0000
.loopx:
	lda.w cont1team,x
	dec a
	asl a
	sta.w padside,x
	inx
	inx
	cpx.w #$000A
	bcc .loopx
	ldx.w #$0000
.loop2x:
	lda.w cont1team,x
	bne .t1x
	inx
	inx
	cpx.w #$000A
	bcc .loop2x
	bra .4

.t1x:
	lda.w #$0001
	sta.w pregamepause
.4:
	lda.w #$FFFF
	sta.w BA_Sktr_SCnum
	lda.w shootoutmode
	beq StartPer
	rtl
