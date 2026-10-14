; Shootout shooters menu item: pick the 3 shooters of each team
ShootoutShooters:
	jsl.l CODE_9DE0E9
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
	jsl.l CODE_9DD9AD
	jsl.l CODE_80CAE1
	jsl.l CODE_9DE0D4
	jsl.l ShootersBackground
	stz.w $1DB9
	lda.w #$0001
	sta.w SelectedPlayerIdx
	stz.w $0D47
	jsl.l PrintShooterNames
	lda.w #$0005
	ldx.w #$0050
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l ScreenOn
ShootersLoop:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$0800
	bne CODE_80CAB8
	bit.w #$0400
	bne CODE_80CAC6
	bit.w #$8080
	bne CODE_80CAD7
	bit.w #$1000
	bne ShootersExit
CODE_80CA9A:
	bra ShootersLoop
ShootersExit:
	ldy.b a2
	bne .t1
	sep #$20
	lda.w homeshooters
	rep #$20
	bra CODE_80CAB0

.t1:
	sep #$20
	lda.w awayshooters
	rep #$20
CODE_80CAB0:
	and.w #$00FF
	dec a
	sta.w tmgoalie,y
	rtl
CODE_80CAB8:
	lda.w $1DB9
	beq CODE_80CA9A
	dec.w $1DB9
	jsl.l PrintShooterNames
	bra CODE_80CA9A
