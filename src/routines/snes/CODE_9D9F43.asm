; Unidentified routine.
CODE_9D9F43:
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF464
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
	lda.w #DATA8_9CF469
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
	lda.w #$009D
	sta.b $9F
	lda.w #DATA8_9DA051
	sta.b $9D
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DA04D
	sta.b a3
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi CODE_9D9FFD
	asl a
	asl a
	asl a
	sta.b d0
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$0006
	clc
	adc.b [a3],y
	sec
	adc.b d0
	sta.b a3
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0004
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq CODE_9D9FFD
	bmi CODE_9D9FF9
	bvc CODE_9D9FFB
CODE_9D9FF7:
	bra CODE_9D9FFD
