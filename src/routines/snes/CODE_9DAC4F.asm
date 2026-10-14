; Unidentified routine.
CODE_9DAC4F:
	phx
	lda.b d7
	sta.b d3
.2:
	lda.b d7
	clc
	adc.b d0
	sta.b d7
	bpl .1
	stz.b d7
.1:
	lda.b d7
	cmp.w #$000E
	bcc .t1
	lda.b d3
	sta.b d7
	bra .3

.t1:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b d7
	tax
	lda.l DATA8_9DAC7F,x
	beq .2
.3:
	plx
	rts
