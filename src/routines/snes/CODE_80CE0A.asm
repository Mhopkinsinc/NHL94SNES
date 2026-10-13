; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
CODE_80CE0A:		; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
	lda.w $1DB9
	bne ShooterSelectList
	jsl.l GoalieCount
	lda.w #$0000
	sta.b $8F
	lda.w #homeshooters
	sta.b $8D
	lda.b $91
	beq CODE_80CE2B
	lda.w #$0000
	sta.b $8F
	lda.w #awayshooters
	sta.b $8D
CODE_80CE2B:
	lda.b [$8D]
	and.w #$00FF
	inc a
	cmp.b $A5
	beq CODE_80CE3A
	bmi CODE_80CE3A
	lda.w #$0001
CODE_80CE3A:
	sep #$20
	sta.b [$8D]
	rep #$20
	rtl
