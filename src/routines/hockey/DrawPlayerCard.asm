; Draw the current player card, including strengths and ratings.
DrawPlayerCard:
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0014
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	ldy.b a2
	lda.w HomeTeam,y
	ldx.w #$00C8
	ldy.w #$0010
	jsl.l CODE_9DDFBF
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
	ldy.w $1DB9
	bne .t2
	jmp.w CODE_9DC0EE

.t2:
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi .t1
	sta.w $1D9B
	bra CODE_9DBF02

.t1:
	clc
	adc.w #$0006
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC298
	sta.b a1
	lda.b [a1],y
	and.w #$00FF
	tay
	lda.b [a3],y
	and.w #$00FF
	dec a
	sta.w $1D9B
CODE_9DBF02:
	lda.w $1D9B
	sta.b d0
	jsl.l PlayerNumName
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000C
	sta.w printy
	jsl.l print
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b d0
	bmi .t2
	jmp.w .t4

.t2:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2B0
	sta.b a1
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l print
	jsl.l CODE_9DC374
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #StrengthsLabel
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E79
	sta.b d0
	bpl .t1
.1:
	jmp.w CODE_9DC0BB

.t1:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E7D
	sta.b d0
	bpl .t3
.1x:
	jmp.w CODE_9DC0BB

.t3:
	lda.w $1E7F
	cmp.w #$0050
	bpl .t1x
	jmp.w CODE_9DC0BB

.t1x:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E81
	sta.b d0
	bpl .t2x
.1x2:
	jmp.w CODE_9DC0BB

.t2x:
	lda.w $1E83
	cmp.w #$0050
	bpl .t1xx
.1xx:
	jmp.w CODE_9DC0BB

.t1xx:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
	jmp.w CODE_9DC0BB

.t4:
	jsl.l GoalieCount
	lda.b d0
	sta.b d1
	jsl.l CODE_9B92DC
	lda.b d0
	clc
	adc.b d1
	cmp.w $1D9B
org $9DC002
	beq .t1x2
	bmi .t1x2
	lda.w #$009D
	sta.b $8F
	lda.w #RosterGroups
	sta.b a1
	bra CODE_9DC01C

.t1x2:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2A7
	sta.b a1
CODE_9DC01C:
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l print
	jsl.l CODE_9DC2FB
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #StrengthsLabelB
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E79
	sta.b d0
	bmi CODE_9DC0BB
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E7D
	sta.b d0
	bmi CODE_9DC0BB
	lda.w $1E7F
	cmp.w #$0050
	bmi CODE_9DC0BB
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E81
	sta.b d0
	bmi CODE_9DC0BB
	lda.w $1E83
	cmp.w #$0050
	bmi CODE_9DC0BB
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
CODE_9DC0BB:
	ldx.w #$0098
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #OverallRating
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	ldx.w #$00A0
	ldy.w #$0084
	jsl.l CODE_9C9590
	jmp.w CODE_9DC208
