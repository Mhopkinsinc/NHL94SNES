; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
PickShooterRow:
	lda.w $1DB9
	bne ShooterSelectList
	jsl.l GoalieCount
	lda.w #homeshooters>>16
	sta.b $8F
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq .2
	lda.w #awayshooters>>16
	sta.b $8F
	lda.w #awayshooters
	sta.b a1
.2:
	lda.b [a1]
	and.w #$00FF
	inc a
	cmp.b d0
	beq .1
	bmi .1
	lda.w #$0001
.1:
	sep #$20
	sta.b [a1]
	rep #$20
	rtl
