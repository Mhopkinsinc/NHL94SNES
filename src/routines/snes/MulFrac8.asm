; A * B (high byte of C) / 128 into A (8-bit); bit 6 of $07E2 set: shift-and-add loop instead of the mode 7 multiplier
MulFrac8:
	bit.w Mode7InUse
	bvc .hw
	rep #$20
	asl a
	sta.b $40
	lsr a
	and.w #$00FF
	sta.b $3E
	lda.w #$0000
	asl.b $40
	bcc .0
	adc.b $3E
.0:
	asl a
	asl.b $40
	bcc .1
	adc.b $3E
.1:
	asl a
	asl.b $40
	bcc .2
	adc.b $3E
.2:
	asl a
	asl.b $40
	bcc .3
	adc.b $3E
.3:
	asl a
	asl.b $40
	bcc .4
	adc.b $3E
.4:
	asl a
	asl.b $40
	bcc .5
	adc.b $3E
.5:
	asl a
	asl.b $40
	bcc .6
	adc.b $3E
.6:
	asl a
	xba
	sep #$20
	rts
.hw:
	asl a
	sta.w M7A
	stz.w M7A
	xba
	sta.w M7B
	lda.w MPYM
	rts
