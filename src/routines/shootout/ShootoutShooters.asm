; Shootout shooters menu item: pick the 3 shooters of each team
ShootoutShooters:
	jsl.l GetPauseTeam
	lda.w #$0001
	sta.b d0
	lda.b a2
	beq .team
	lda.w #$0002
	sta.b d0
.team:
	lda.w $1C84
	cmp.b d0
	beq .t1
	lda.w $1C86
	cmp.b d0
	beq .t1
	jmp.w ShootersExit

.t1:
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$FFFF
	sta.l $7E3452
	jsl.l SetupScreen
	jsl.l ShootersSetup
	jsl.l SendColours
	jsl.l ShootersBackground
	stz.w $1DB9
	lda.w #$0001
	sta.w SelectedPlayerIdx
	stz.w $0D47
	jsl.l PrintShooterNames
	lda.w #$0005
	ldx.w #$0050
	jsl.l SetupBandIRQ
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
ShootersLoop:
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$0800
	bne ShootersUp
	bit.w #$0400
	bne ShootersDown
	bit.w #$8080
	bne ShootersPick
	bit.w #$1000
	bne ShootersExit
ShootersNext:
	bra ShootersLoop
ShootersExit:
	ldy.b a2
	bne .t1
	sep #$20
	lda.w homeshooters
	rep #$20
	bra ShootersSetGoalie

.t1:
	sep #$20
	lda.w awayshooters
	rep #$20
ShootersSetGoalie:
	and.w #$00FF
	dec a
	sta.w tmgoalie,y
	rtl
ShootersUp:
	lda.w $1DB9
	beq ShootersNext
	dec.w $1DB9
	jsl.l PrintShooterNames
	bra ShootersNext
ShootersDown:
	lda.w $1DB9
	cmp.w #$0005
	bpl ShootersNext
	inc.w $1DB9
	jsl.l PrintShooterNames
	bra ShootersNext
ShootersPick:
	jsl.l PickShooterRow
	jsl.l PrintShooterNames
	bra ShootersNext
ShootersSetup:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ShootoutShootersPos>>16
	sta.b $8F
	lda.w #ShootoutShootersPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ShootoutShootersPos2>>16
	sta.b $8F
	lda.w #ShootoutShootersPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l FramerOutline
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #LineupTxt>>16
	sta.b $8F
	lda.w #LineupTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l ShootersBackground
	rtl
