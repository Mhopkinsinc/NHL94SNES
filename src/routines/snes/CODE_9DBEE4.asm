; Unidentified routine.
CODE_9DBEE4:
	clc
	adc.w #$0006
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC298
	sta.b $8D
	lda.b [$8D],y
	and.w #$00FF
	tay
	lda.b [$95],y
	and.w #$00FF
	dec a
	sta.w $1D9B
CODE_9DBF02:
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC372
	lda.b [$8D]
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
	jsl.l CODE_9EC7BE
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b $A5
	bmi CODE_9DBF33
	jmp.w $BFEE
