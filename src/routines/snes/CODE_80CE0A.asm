; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
CODE_80CE0A:		; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
	lda.w $1DB9
	bne ShooterSelectList
	jsl.l GoalieCount
	lda.w #$0000
	sta.b $8F
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq CODE_80CE2B
	lda.w #$0000
	sta.b $8F
	lda.w #awayshooters
	sta.b a1
CODE_80CE2B:
	lda.b [a1]
	and.w #$00FF
	inc a
	cmp.b d0
	beq CODE_80CE3A
	bmi CODE_80CE3A
	lda.w #$0001
CODE_80CE3A:
	sep #$20
	sta.b [a1]
	rep #$20
	rtl
