; Unidentified routine.
CODE_9FACFC:
	lda.w #$0001
	sta.w printy
	lda.w #$0006
	sta.w printx
	lda.w #$0014
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	jsl.l CODE_9D8000
	lda.w $1E91
	sta.b $91
	lda.w #$0005
	sta.w printy
	lda.w $1E8F
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [$8D]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$000F
	sta.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	inc.w printy
	lda.w $1E91
	eor.w #$0002
	sta.b $91
	tay
	lda.w tmgoalie,y
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [$8D]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l CODE_9EC7BE
	lda.w #$0007
	sta.w printx
	lda.w #$0002
	sta.w printy
	lda.w $1D81
	beq CODE_9FADA7
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8B8
	sta.b $8D
	jsl.l CODE_9ECE15
	bra CODE_9FADB5
