; Record the played playoff game and the series wins
ResolveGames:
	lda.l $7E35D6
	asl a
	sta.b d0
	stz.b a0
	tax
	lda.w $178E
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
	lda.w $0ACF
	cmp.w #$0007
	bne .4
	jmp.w CODE_9F961F
.4:
	ldx.b a0
	lda.w #$0004
	cmp.l $7E3548,x
	beq .3
	cmp.l $7E3558,x
	beq .3
	stz.b d3
	lda.l $7E3598,x
	bit.w #$0001
	beq .1
	lda.w #$0010
	sta.b d3
.1:
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bpl .2
	lda.b d3
	eor.w #$0010
	sta.b d3
.2:
	lda.b a0
	clc
	adc.b d3
	tax
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
.3:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .4
	inc.w $0ACF
	lda.w $0ACF
	cmp.w #$0007
	bne .t3
	jmp.w .7

.t3:
	lda.l $7E35D6
	asl a
	sta.b a0
	tax
	lda.w #$0004
	cmp.l $7E3548,x
	beq .t1
	cmp.l $7E3558,x
	beq .t1
	jmp.w .8

.t1:
	lda.l playoffRoundIdx
	sec
	sbc.w #$0003
	bmi .t2
	bvs .5
	bra .7

.t2:
	bvs .7
.5:
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
.6:
	ldx.b a0
	lda.b d1
	cmp.l $7E35D6
	beq .t1x
	lda.w #$0004
	cmp.l $7E3548,x
	beq .t1x
	cmp.l $7E3558,x
	beq .t1x
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
	jsl.l RandomWord
	lsr a
	bcc .6
	lda.l $7E3548,x
	dec a
	sta.l $7E3548,x
	lda.l $7E3558,x
	inc a
	sta.l $7E3558,x
	bra .6

.t1x:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .6
	jsl.l WritePassBits
	ldx.w #$000E
.loop:
	lda.l passbits,x
	sta.l $7E3518,x
	dex
	dex
	bpl .loop
	lda.w #$0004
	tsb.w sflags3
.7:
	stz.w $0ACF
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
	stz.b d3
.loopx:
	ldx.b a0
	lda.l $7E3548,x
	cmp.w #$0004
	beq .1x
	lda.b d1
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b d3
.1x:
	lda.b a0
	lda.w #$0000
	sta.l $7E3548,x
	sta.l $7E3558,x
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loopx
	lda.b d2
	asl a
	tax
	lda.l DATA8_80DA26,x
	tax
	dec a
	and.w $0AD5
	sta.w $0AD5
	lda.b d3
	jsl.l Mul16U
	lda.b $08
	tsb.w $0AD5
	lda.l playoffRoundIdx
	inc a
	sta.l playoffRoundIdx
.8:
	rtl
