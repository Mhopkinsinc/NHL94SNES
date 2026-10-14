; Unidentified routine.
CODE_9EE30B:
	lda.b d3
	cmp.w #tmp2
	bcs CODE_9EE321
	lda.w #$0010
	adc.w $1383,x
	jsl.l CODE_9BB385
	cmp.w #$000F
	bcs CODE_9EE387
CODE_9EE321:
	lda.w passspeed
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $1383,x
	clc
	adc.w #$0010
	ldx.b d3
	jsl.l Mul16U
	lda.b $08
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	lda.b d3
	cmp.w #$00FB
	bcs CODE_9EE348
	lsr.b d0
CODE_9EE348:
	lda.b d0
	cmp.w #$0088
	bcc CODE_9EE354
	lda.w #$0088
	sta.b d0
CODE_9EE354:
	pha
	jsl.l randomd0s
	adc.b $03,s
	sta.b $03,s
	lda.b $01,s
	sta.b d0
	cmp.w #$003D
	bcc CODE_9EE36D
	lda.w #$003C
	sta.b d0
	sta.b $01,s
CODE_9EE36D:
	lda.b $05,s
	bpl CODE_9EE373
	lsr.b d0
CODE_9EE373:
	jsl.l CODE_9BB3B0
	lda.b $05,s
	adc.b d0
	sta.b $05,s
	pla
	lsr a
	jsl.l CODE_9BB370
	adc.b $05,s
	sta.b $05,s
CODE_9EE387:
	ldx.w passspeed
	lda.w #$0044
	jsl.l CODE_808F5D
	plx
	jsl.l Mul16S
	lda.b d3
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w puckvx
	ldx.w passspeed
	lda.w #$0044
	jsl.l CODE_808F5D
	plx
	jsl.l Mul16S
	lda.b d3
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w puckvy
	ldx.b $E4
	pla
	beq CODE_9EE408
	tax
	lda.w passspeed
	jsl.l CODE_808F98
	ldx.b $08
	lda.w #$0044
	jsl.l CODE_808F98
	lda.b d3
	sta.b $04
	jsl.l Div32U
	lda.b $00
	asl a
	sta.b d1
	lda.w #$0B33
	ldx.b d3
	jsl.l Mul16U
	lda.w passspeed
	sta.b $04
	jsl.l Div32U
	ldx.b $E4
	lda.b $00
	lsr a
	adc.b d1
	cmp.w #DMA_VRAMWORD
	bcc CODE_9EE405
	lda.w #$1800
CODE_9EE405:
	sta.w $0E01
CODE_9EE408:
	pla
	jsl.l CODE_9C9ABC
	ldx.b a3
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EE41A
	ldy.w #$FEF8
CODE_9EE41A:
	sty.b tmp0
	tya
	sec
	sbc.w pucky
	eor.w puckvy
	bpl CODE_9EE430
	lda.w #$0000
	sec
	sbc.w puckvy
	sta.w puckvy
CODE_9EE430:
	lda.w $163A
	beq CODE_9EE43E
	lda.w #$0012
	sta.b d0
	jsl.l assreplace
CODE_9EE43E:
	rtl
