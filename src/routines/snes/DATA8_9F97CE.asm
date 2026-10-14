; Unidentified routine.
DATA8_9F97CE:
	dw 12,162,267,307,218,227
	asl.b d0
	lda.b a2
	beq CODE_9F97E3
	lda.w #$0034
CODE_9F97E3:
	adc.b d0
	tay
	lda.w tmpdst,y
	sta.b d0
	bpl CODE_9F9811
	eor.w #$FFFF
	sta.b d0
	cmp.w #$0004
	bcc CODE_9F9803
CODE_9F97F7:
	lda.w #$0001
	sta.b d0
	bra CODE_9F9803
