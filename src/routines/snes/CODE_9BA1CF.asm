; Unidentified routine.
CODE_9BA1CF:
	jsl.l RandomWord
	and.w #$003F
	sta.b d0
	lsr a
	adc.b d0
	clc
	adc.w #$0050
	asl a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l RandomWord
	and.w #$003F
	clc
	adc.w #$0060
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	jsl.l RandomWord
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	sta.l $7E33A8,x
	jsl.l RandomWord
	and.w #$003F
	clc
	adc.w #$0078
	sta.b d2
	lda.b d1
	sec
	sbc.l $7E33A8,x
	tax
	lda.b d2
	jsl.l DivX8S
	ldx.b d4
	sta.l $7E33E4,x
	lda.b d0
	and.w #$0100
	beq CODE_9BA23C
	lda.w #$1100
	sta.l $7E3394,x
	lda.b d0
	sec
	sbc.w #$1100
	bra CODE_9BA249
