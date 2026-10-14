; Assignment: the puck most of the time
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
	lda.w puckc
	bmi .4
	sta.b a2
	jsl.l a2touchpuck
	lda.b a2
	jsl.l GetHot
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
	bne .13
	lda.w puckc
	bpl .11
	lda.w $163A
	beq .9
	lda.w gmode
	bit.w #$0002
	bne .t1
	lda.w $1E91
	beq .7
.5:
	bra .6

.t1:
	lda.w $1E91
	bne .7
.6:
	lda.w puckvy
	bmi .9
	bra .8
.7:
	lda.w puckvy
	dec a
	bpl .9
.8:
	lda.l $7E3450
	inc a
	sta.l $7E3450
	cmp.w #$0030
	bcc .10
	jsl.l CODE_9EC791
.9:
	lda.w #$0000
	sta.l $7E3450
.10:
	lda.w $0D71
	cmp.w $0E5F
	bne .12
	lda.w pucky
	cmp.w $0E9F
	bne .12
	lda.w #$0006
	sta.b d0
	dec.w $10BF
	bpl .13
.1x:
	jsl.l AddPenalty2
	bra .13
.11:
	lda.w #$0000
	sta.l $7E3450
.12:
	lda.w #$0078
	sta.w $10BF
.13:
	lda.w $0E01
	and.w #$FF00
	ora.w $0DF9
	beq .t1x
	jmp.w checkpuckcoll

.t1x:
	jsl.l pucknothing
	jmp.w checkpuckcoll
