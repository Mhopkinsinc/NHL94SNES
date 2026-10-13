; Unidentified routine.
CODE_9EA719:
	asl.b $AD
	asl.b $AD
	ldx.b $AD
	lda.l DATA8_9EA889+2,x
	sta.b $A9
	lda.l DATA8_9EA889,x
	sta.b $A5
	ldx.b $E4
	lda.w $1123,x
	beq CODE_9EA738
	eor.b $A5
	bpl CODE_9EA738
	stz.b $A5
CODE_9EA738:
	lda.w $1103,x
	beq CODE_9EA743
	eor.b $A9
	bmi CODE_9EA743
	stz.b $A9
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
	sta.b $AD
	lda.w $12E3,x
	lsr a
	adc.b $AD
	sta.b $AD
	lda.w position,x
	bne CODE_9EA78C
	lda.w $19D4,x
	bmi CODE_9EA77B
	cpx.w puckc
	beq CODE_9EA77B
	lda.w $12E3,x
	asl a
	adc.b $AD
	adc.w #$0008
	sta.b $AD
	bra CODE_9EA78C
