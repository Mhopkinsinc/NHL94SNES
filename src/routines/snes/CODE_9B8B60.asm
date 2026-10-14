; Unidentified routine.
CODE_9B8B60:
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
	lda.l $7E35D0
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
	lda.w #DATA8_9B8C6E
	sta.b $9D
	lda.w #$009B
	sta.b $9F
	lda.w #DATA8_9B8C6A
	sta.b a3
	lda.w #$009B
	sta.b $97
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi CODE_9B8BFD
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9B9320
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
	beq CODE_9B8BFD
	bmi CODE_9B8BF9
CODE_9B8BF5:
	bvc CODE_9B8BFB
	bra CODE_9B8BFD
