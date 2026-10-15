; Team roster for the team in a2. Y switches team, start leaves.
TeamRoster:
	jsl.l GetPauseTeam
	ldy.b a2
	lda.w tmline,y
	inc a
	sta.b d0
	sta.w SelectedPlayerIdx
	stz.w DispAttribCtr
	ldx.b a2
	lda.w HomeTeam,x
	sta.l setupvis
	lda.w #$001D
	sta.l setuphome
	jsl.l SetupScreen
	ldx.w #$004C
	ldy.w #$0018
	lda.w #TeamRosterTitle>>16
	sta.b a1+2
	lda.w #TeamRosterTitle
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l FadeIn
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
	lda.w #textmap>>16
	sta.b p1+2
	lda.w #textmap
	sta.b p1
	lda.l blankchar
	clc
	adc.l charofs
	ldx.w #$0800
	jsl.l MemFill
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #PlayerRatingTxt>>16
	sta.b a1+2
	lda.w #PlayerRatingTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0800
	sta.w printa
	lda.w #$000F
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #TeamRosterPos>>16
	sta.b a1+2
	lda.w #TeamRosterPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w #$0800
	sta.w printa
	lda.w #$000F
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
TeamRosterRedraw:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #TeamRosterPos2>>16
	sta.b a1+2
	lda.w #TeamRosterPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w HomeTeam
	sta.b d1
	lda.b a2
	beq .1
	lda.w VisTeam
	sta.b d1
	lda.w #$0030
.1:
	sta.b d0
	jsl.l DrawTeamBlocks
	jsl.l SpriteFrameEnd
	lda.w #$7F97
	sta.l colourbuf+2
	lda.w #$FFFF
	sta.l colourbuf+$42
	jsl.l SendColours
	jsl.l ShowRosterLine
TeamRosterLoop:
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t1
	jmp.w RosterRtl

.t1:
	bit.w #$4000
	bne SwapRosterTeam
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne MoveRosterColumn
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne MoveRosterColumn
	bit.w #$0800
	bne .1
	inc.b d0
	inc.b d0
	bit.w #$0400
	beq TeamRosterShowLine
.1:
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	sta.b d0
	bmi TeamRosterShowLine
	cmp.w #$0008
	bcs TeamRosterShowLine
	sta.w SelectedPlayerIdx
	jsl.l ShowRosterLine
TeamRosterShowLine:
	jmp.w TeamRosterLoop
