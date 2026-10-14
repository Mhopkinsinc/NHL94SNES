; Unidentified routine.
CODE_9B85E8:
	ldx.w #$0080
	stz.b $14
	stz.b $16
	lda.b $04
	asl a
	asl a
	tay
CODE_9B85F4:
	lda.b ($0C),y
	beq CODE_9B85DC
	xba
	tay
.loop:
	tya
	asl a
	bcc .1
	tay
	txa
	tsb.b $15
	tya
.1:
	asl a
	bcc .2
	tay
	txa
	tsb.b $14
	tya
.2:
	asl a
	bcc .3
	tay
	txa
	tsb.b $17
	tya
.3:
	asl a
	bcc .4
	tay
	txa
	tsb.b $16
	tya
.4:
	tay
	txa
	lsr a
	tax
	cpx.w #$0010
	bcs .loop
	cpx.w #$0000
	beq CODE_9B8637
	cpx.w #$0008
	bcc .loop
	lda.b $04
	asl a
	asl a
	tay
	iny
	iny
	bra CODE_9B85F4
