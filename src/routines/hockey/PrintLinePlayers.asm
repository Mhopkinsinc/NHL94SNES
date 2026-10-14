; Line editor: erase the line area and print the selected line's players by position, with the goalie marks
PrintLinePlayers:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF072
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
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF077
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
	lda.w #LineGoalieMarks
	sta.b $9D
	lda.w #$009B
	sta.b $9F
	lda.w #.4
	sta.b a3
	lda.w #$009B
	sta.b $97
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi .3
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l GetTeamLines
	sec
	adc.b d0
	sta.b a3
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w #$0004
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq .3
	bmi .t1
.1:
	bvc .2
	bra .3

.t1:
	bvc .3
.2:
	dec.b d1
.3:
	lda.w #$3800
	sta.w $0D0D
	lda.b d1
	cmp.w $1D8B
	bne .1x
	lda.w #$2000
	sta.w $0D0D
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.l $7E345A
.1x:
	lda.w #$0005
	sta.w printx
	lda.b $9D
	sta.b a1
	lda.b $9F
	sta.b $8F
	jsl.l print
	lda.b a1
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0008
	sta.w printx
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.b d0
	jsl.l PlayerNumName
	jsl.l print
	inc.b a3
	pla
	sta.b $8F
	pla
	sta.b a1
	inc.w printy
	inc.w printy
	dec.b d1
	bmi .t1x
	jmp.w .3

.t1x:
	jsl.l DrawEditLinesTitle
	rts
.4:
	db $01,$02,$03,$04
