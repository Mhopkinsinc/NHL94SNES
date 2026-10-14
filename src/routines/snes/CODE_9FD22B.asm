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
	beq .1
	ora.b #$00
.1:
	clc
	adc.b $16
	bpl .2
	lda.b #$00
.2:
	cmp.b #$0F
	bcc .3
	lda.b #$0F
.3:
	rep #$20
	and.w #$00FF
	rtl
