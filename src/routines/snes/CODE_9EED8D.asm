; Unidentified routine.
CODE_9EED8D:
	cpx.w puckc
	bne .t2
	lda.w pflags,x
	bit.w #$0002
	beq .t3
	jsl.l CODE_9EECF6
	lda.w pflags,x
	and.w #$FFFD
	sta.w pflags,x
	lda.w $19D4,x
	bpl .t3
	lda.w $0BA5
	cmp.w #$0014
	beq .t1
	cmp.w #$0008
	beq .t1
.rtl:
	rtl

.t1:
	jmp.w CompShoot

.t2:
	jmp.w assexit

.t3:
	ldy.w #$0000
	lda.w passdir
	cmp.w facedir,x
	beq .t1x
	iny
	dec a
	and.w #$0007
	cmp.w facedir,x
	beq .t1x
	iny
	inc a
	inc a
	and.w #$0007
	cmp.w facedir,x
	beq .t1x
	lda.w passdir
	sta.b d0
	jsl.l CODE_9EDC06
	rtl

.t1x:
	lda.w position,x
	bne .2
.1:
	tya
	asl a
	adc.w $0BA5
	sta.w $0BA5
	lda.w facedir,x
	sta.w passdir
.2:
	jsl.l .t2x
	jmp.w assexit

.t2x:
	phk
	plb
	lda.w #$000F
	sec
	sbc.w $13A3,x
	asl a
	sta.b d4
	ldy.w $0BA5
	lda.w DATA8_9EEED4,y
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.w DATA8_9EEF04,y
	sec
	sbc.w $0D71
	sta.b d0
	lda.w DATA8_9EEEEC,y
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.w DATA8_9EEF1C,y
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l ApproxLength
	sta.b d2
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0078
	jsl.l DivX8U
	cmp.w #$0060
	bcc .2x
.1x:
	lda.w #$0060
.2x:
	ldx.b $E4
	ldy.w position,x
	beq .t1xx
	cmp.w #$0010
	bcs .4
.3:
	lda.w #$0010
.4:
	bra .5

.t1xx:
	cmp.w #$0020
	bcs .5
	lda.w #$0020
.5:
	sta.b d3
	ldx.b d0
	jsl.l Mul16x8XS
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b d3
	ldx.b d1
	jsl.l Mul16x8XS
	lda.b d2
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvy
	asl a
	asl a
	asl a
	asl a
	lda.w #$03C0
	sec
	sbc.b d4
	jsl.l randoma
	clc
	adc.w #$10E0
	sta.w $0E01
	jsl.l puckflip
	ldx.b $E4
	lda.w #$FFFF
	sta.w $0BA3
	sta.w puckc
	lda.w #$001E
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	jmp.w CODE_9EEACC
