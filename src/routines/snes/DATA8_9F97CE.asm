; Unidentified routine.
DATA8_9F97CE:
	dw 12,162,267,307,218,227
	asl.b $A5
	lda.b $91
	beq CODE_9F97E3
	lda.w #$0034
CODE_9F97E3:
	adc.b $A5
	tay
	lda.w tmpdst,y
	sta.b $A5
	bpl CODE_9F9811
	eor.w #$FFFF
	sta.b $A5
	cmp.w #$0004
	bcc CODE_9F9803
CODE_9F97F7:
	lda.w #$0001
	sta.b $A5
	bra CODE_9F9803
