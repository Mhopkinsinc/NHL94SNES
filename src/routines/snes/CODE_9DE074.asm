; Unidentified routine.
CODE_9DE074:
	lda.w #$0200
	sta.l blankchar
	inc a
	sta.l $7E35B6
	lda.w #$0000
	ldy.w #$3000
	ldx.w #$0020
	jsl.l FillVRAM
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	adc.l $7E35B6
	sta.l $7E35BC
	adc.w #$0004
	sta.l $7E35CE
	rtl
