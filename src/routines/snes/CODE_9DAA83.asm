; Unidentified routine.
CODE_9DAA83:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.w #$0004
	tax
	lda.l DATA8_9DAC7F,x
	bne CODE_9DAAC5
	lda.w #$001C
	sta.l $7E3454
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra CODE_9DAACC
