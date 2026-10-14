; Unidentified routine.
CODE_9DBEE4:
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
	bmi CODE_9DBF33
	jmp.w CODE_9DBFEE
