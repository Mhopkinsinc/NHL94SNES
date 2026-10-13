; Unidentified routine.
CODE_9B8B60:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF072
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF077
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b $A5
	dec a
	sta.b $A9
	lda.w #DATA8_9B8C6E
	sta.b $9D
	lda.w #$009B
	sta.b $9F
	lda.w #DATA8_9B8C6A
	sta.b $95
	lda.w #$009B
	sta.b $97
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_9B8BFD
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l CODE_9B9320
	sec
	adc.b $A5
	sta.b $95
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w #$0004
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_9B8BFD
	bmi CODE_9B8BF9
CODE_9B8BF5:
	bvc CODE_9B8BFB
	bra CODE_9B8BFD
