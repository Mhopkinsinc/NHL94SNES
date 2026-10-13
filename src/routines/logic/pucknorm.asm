; Unidentified routine.
pucknorm:
	lda.w #$0002
	trb.w $129F
	beq CODE_9EDCC3
	stz.w $101F
	stz.w $103F
	lda.w #$0078
	sta.w $10BF
	lda.w #$0000
	sta.l $7E3450
CODE_9EDCC3:
	lda.w $0D19
	sec
	sbc.b $C1
	sta.w $0D19
	lda.w $0D1D
	sec
	sbc.b $C1
	sta.w $0D1D
	lda.w $101F
	sec
	sbc.b $C1
	sta.w $101F
	bpl CODE_9EDCEA
	adc.w #$0005
	sta.w $101F
	jsl.l CODE_9EDDD2
CODE_9EDCEA:
	lda.w puckc
	bmi CODE_9EDD3F
	sta.b $91
	jsl.l a2touchpuck
	lda.b $91
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9EDD11
	ora.w #$C000
CODE_9EDD11:
	clc
	adc.w puckx
	sta.w puckx
	lda.b $A9
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9EDD2C
	ora.w #$C000
CODE_9EDD2C:
	clc
	adc.w pucky
	sta.w pucky
	lda.w Xvel,y
	sta.w puckvx
	lda.w Yvel,y
	sta.w puckvy
CODE_9EDD3F:
	jsl.l CODE_9EF751
	jsl.l CODE_9EF78A
	lda.w gmclock
	bne CODE_9EDDBD
	lda.w puckc
	bpl CODE_9EDDB0
	lda.w $163A
	beq CODE_9EDD89
	lda.w gmode
	bit.w #$0002
	bne CODE_9EDD65
	lda.w $1E91
	beq CODE_9EDD71
CODE_9EDD63:
	bra CODE_9EDD6A
