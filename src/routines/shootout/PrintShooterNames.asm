; Shootout shooters: the shooters' names
PrintShooterNames:		; print the goalie and shooter rows, the row at the cursor ($1DB9) in another palette
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFAB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0013
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFB0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b d0
	dec a
	sta.b d1
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDAA
	sta.b $9D
	lda.w #$0080
	sta.b $97
	lda.w #DATA8_80CDA6
	sta.b a3
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi .2
	asl a
	asl a
	asl a
	sta.b d0
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .1
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b a3
.1:
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDB6
	sta.b $9D
	lda.w #$0005
	sta.b d1
.2:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$0005
	sec
	sbc.b d1
	cmp.w $1DB9
	bne .5
	lda.w #$2000
	sta.w $0D0D
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.l $7E345A
	phx
	ldx.b a2
	lda.w HomeTeam,x
	cmp.w #$0018
	bcc .4
.3:
	ldx.w #$0000
	lda.l $7E345A
	lda.b $12
	sta.b $0E
	lda.b $10
	sta.b $0C
	jsl.l CODE_80B719
.4:
	plx
.5:
	lda.w #$0005
	sta.w printx
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b a1
	jsl.l print
	lda.b $8F
	sta.b $9F
	lda.b a1
	sta.b $9D
	lda.w #$0008
	sta.w printx
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.b d0
	jsl.l PlayerNumName
	jsl.l print
	inc.b a3
	inc.w printy
	inc.w printy
	dec.b d1
	bmi .t1
	jmp.w .2

.t1:
	jsl.l ShootersBackground
	rtl
