; Unidentified routine.
CODE_9DCA08:
	lda.w #$6F00
	sta.b $10
	sta.l $7E3470
CODE_9DCA11:
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	jsl.l CODE_9DCB1C
	bne CODE_9DCA56
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b $91
	beq CODE_9DCA4E
	clc
	adc.w #$0030
CODE_9DCA4E:
	plx
	ply
	jsl.l CODE_808E2D
	bra CODE_9DCA85
