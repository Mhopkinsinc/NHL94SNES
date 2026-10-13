; Unidentified routine.
CODE_9BA1CF:
	jsl.l RandomWord
	and.w #$003F
	sta.b $A5
	lsr a
	adc.b $A5
	clc
	adc.w #$0050
	asl a
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l RandomWord
	and.w #$003F
	clc
	adc.w #$0060
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
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
	sta.b $AD
	lda.b $A9
	sec
	sbc.l $7E33A8,x
	tax
	lda.b $AD
	jsl.l DivX8S
	ldx.b $B5
	sta.l $7E33E4,x
	lda.b $A5
	and.w #$0100
	beq CODE_9BA23C
	lda.w #$1100
	sta.l $7E3394,x
	lda.b $A5
	sec
	sbc.w #$1100
	bra CODE_9BA249
