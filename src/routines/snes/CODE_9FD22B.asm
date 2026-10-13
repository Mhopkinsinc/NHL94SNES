; Unidentified routine.
CODE_9FD22B:
	sta.b $16
	tya
	clc
	adc.b $14
	tay
	sep #$20
	lda.w $1A12,y
	lsr a
	lsr a
	bit.b #$00
	beq CODE_9FD23F
	ora.b #$00
CODE_9FD23F:
	clc
	adc.b $16
	bpl CODE_9FD246
	lda.b #$00
CODE_9FD246:
	cmp.b #$0F
	bcc CODE_9FD24C
	lda.b #$0F
CODE_9FD24C:
	rep #$20
	and.w #$00FF
	rtl
