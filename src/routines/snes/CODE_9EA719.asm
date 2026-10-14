; Unidentified routine.
CODE_9EA719:
	asl.b d2
	asl.b d2
	ldx.b d2
	lda.l DATA8_9EA889+2,x
	sta.b d1
	lda.l DATA8_9EA889,x
	sta.b d0
	ldx.b $E4
	lda.w $1123,x
	beq CODE_9EA738
	eor.b d0
	bpl CODE_9EA738
	stz.b d0
CODE_9EA738:
	lda.w $1103,x
	beq CODE_9EA743
	eor.b d1
	bmi CODE_9EA743
	stz.b d1
CODE_9EA743:
	lda.w $12C3,x
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0020
	clc
	adc.w $12E3,x
	sta.b d2
	lda.w $12E3,x
	lsr a
	adc.b d2
	sta.b d2
	lda.w position,x
	bne CODE_9EA78C
	lda.w $19D4,x
	bmi CODE_9EA77B
	cpx.w $0AD9
	beq CODE_9EA77B
	lda.w $12E3,x
	asl a
	adc.b d2
	adc.w #$0008
	sta.b d2
	bra CODE_9EA78C
