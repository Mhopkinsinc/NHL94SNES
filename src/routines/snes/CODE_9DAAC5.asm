; Unidentified routine.
CODE_9DAAC5:
	lda.w VisTeam
	sta.l $7E3454
CODE_9DAACC:
	dex
	dex
	lda.l DATA8_9DAC7F,x
	bne CODE_9DAB04
	lda.w #$001D
	sta.l $7E3452
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra CODE_9DAB0B
