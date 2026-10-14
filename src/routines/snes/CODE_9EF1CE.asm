; Unidentified routine.
CODE_9EF1CE:
	lda.w #$0002
	clc
	adc.w $1363,y
	xba
	and.w #$FF00
	asl a
	jsl.l randoma
	adc.w #$2000
	sta.b d0
	cmp.w puckvx
	bmi CODE_9EF1CB
	lda.b d0
	cmp.w puckvy
	bmi CODE_9EF1CB
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	cmp.w puckvx
	bpl CODE_9EF1CB
	lda.b d0
	cmp.w puckvy
	bpl CODE_9EF1CB
	ldy.b a2
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9EF1CB
	stz.w $0E01
	jmp.w puckglue
