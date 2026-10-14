; Unidentified routine.
DATA8_9EDC94:
	dw 0,-7,-10,-7,0,7,10,7,0,-7
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
	sbc.b d7
	sta.w $0D19
	lda.w $0D1D
	sec
	sbc.b d7
	sta.w $0D1D
	lda.w $101F
	sec
	sbc.b d7
	sta.w $101F
	bpl .1
	adc.w #$0005
	sta.w $101F
	jsl.l CODE_9EDDD2
.1:
	lda.w shotPlIdx
	bmi .4
	sta.b a2
	jsl.l a2touchpuck
	lda.b a2
	jsl.l CODE_9BC002
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	lsr a
	lsr a
	bit.w #$2000
	beq .2
	ora.w #$C000
.2:
	clc
	adc.w $0D71
	sta.w $0D71
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	lsr a
	lsr a
	bit.w #$2000
	beq .3
	ora.w #$C000
.3:
	clc
	adc.w pucky
	sta.w pucky
	lda.w $0EC3,y
	sta.w puckvx
	lda.w $0EE3,y
	sta.w puckvy
.4:
	jsl.l puckIChk
	jsl.l CODE_9EF78A
	lda.w gmclock
	bne CODE_9EDDBD
	lda.w shotPlIdx
	bpl CODE_9EDDB0
	lda.w $163A
	beq CODE_9EDD89
	lda.w gmode
	bit.w #$0002
	bne .t1
	lda.w $1E91
	beq CODE_9EDD71
.5:
	bra CODE_9EDD6A

.t1:
	lda.w $1E91
	bne CODE_9EDD71
CODE_9EDD6A:
	lda.w puckvy
	bmi CODE_9EDD89
	bra CODE_9EDD77
