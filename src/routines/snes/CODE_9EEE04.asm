; Unidentified routine.
CODE_9EEE04:
	phk
	plb
	lda.w #$000F
	sec
	sbc.w $13A3,x
	asl a
	sta.b d4
	ldy.w $0BA5
	lda.w DATA8_9EEED4,y
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.w DATA8_9EEF04,y
	sec
	sbc.w $0D71
	sta.b d0
	lda.w DATA8_9EEEEC,y
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.w DATA8_9EEF1C,y
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l CODE_9CA554
	sta.b d2
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0078
	jsl.l DivX8U
	cmp.w #$0060
	bcc CODE_9EEE57
CODE_9EEE54:
	lda.w #$0060
CODE_9EEE57:
	ldx.b $E4
	ldy.w position,x
	beq CODE_9EEE68
	cmp.w #$0010
	bcs CODE_9EEE66
CODE_9EEE63:
	lda.w #$0010
CODE_9EEE66:
	bra CODE_9EEE70
