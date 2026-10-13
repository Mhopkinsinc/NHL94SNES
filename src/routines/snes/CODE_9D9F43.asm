; Unidentified routine.
CODE_9D9F43:
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF464
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
	lda.w #DATA8_9CF469
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
	lda.w #$009D
	sta.b $9F
	lda.w #DATA8_9DA051
	sta.b $9D
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DA04D
	sta.b $95
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_9D9FFD
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$0006
	clc
	adc.b [$95],y
	sec
	adc.b $A5
	sta.b $95
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0004
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_9D9FFD
	bmi CODE_9D9FF9
	bvc CODE_9D9FFB
CODE_9D9FF7:
	bra CODE_9D9FFD
