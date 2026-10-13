; Unidentified routine.
CODE_9C99E5:
	lda.l $7E35E6
	sta.l $7E35EA
	asl a
	asl a
	tax
	lda.l DATA8_9C9A5B-4,x
	sta.b $3E
	lda.l DATA8_9C9A5B-2,x
	sta.b $40
	ldy.w #$0000
	lda.b [$3E],y
	xba
	sta.b $42
	ldy.w #$0002
	lda.b [$3E],y
	xba
	tax
	ldy.b $42
	lda.b $3E
	clc
	adc.w #$0004
	sta.b $3E
	jsl.l SPCStreamStart
	lda.w #$0001
	sta.l $7E35E8
CODE_9C9A20:
	rtl
