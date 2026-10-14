; The stick is at the puck: launch it toward the goal
doshot:
	jsl.l shotdiradj
	lda.w #$0007
	pha
	lda.w #$0008
	trb.w sflags
	sta.w pfalock,x
	stx.w $0D29
	cpx.w puckc
	beq .t2
	jmp.w .7

.t2:
	lda.w #$0001
	sta.b $01,s
	lda.w #$1000
	tsb.w sflags
	lda.w SPA,x
	cmp.w #SPAshotb
	bne .1
	lda.w #$0001
	sta.b $01,s
	lda.w passspeed
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w passspeed
	sta.w passspeed
.1:
	lda.w passspeed
	sta.w $0BC5
	cmp.w #$001E
	bcc .2
	lda.w #$0002
	sta.b $01,s
.2:
	lda.w $1363,x
	stx.b a0
	jsl.l makepde
	adc.w #$0014
	tax
	lda.w passspeed
	jsl.l Mul16x8U
	ldx.b $08
	lda.w #$2570
	jsl.l Mul16U
	lda.b $0A
	sta.w passspeed
	lda.w $1E8B
	beq .3
	jsl.l CheckBreakaway
	lda.w $1638
	sta.w $1E8B
.3:
	ldx.b $E4
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0010
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	ldy.w #$0108
	lda.w pfgoal,x
	bne .4
	ldy.w #$FEF8
.4:
	sty.b d1
	lda.w passdir
	asl a
	asl a
	tay
	lda.w #shotsets>>16
	sta.b $8B
	lda.w #shotsets
	sta.b a0
	lda.b [a0],y
	sec
	sbc.w $0D71
	sta.b d0
	iny
	iny
	lda.b [a0],y
	sta.b d2
	pha
	lda.b d1
	sec
	sbc.w pucky
	sta.b d1
	pha
	lda.b d0
	pha
	lda.b d0
	ldy.b d1
	jsl.l ApproxLength
	cmp.w #$0000
	bne .5
	inc a
.5:
	sta.b d3
	lda.w gmode
	bit.w #$0010
	beq .t1
	jmp.w .6

.t1:
	lda.b d3
	cmp.w #$00C9
	bcs .1x
	lda.w #$0010
	adc.w $1383,x
	jsl.l randoma8
	cmp.w #$000F
	bcs .6
.1x:
	lda.w passspeed
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $1383,x
	clc
	adc.w #$0010
	ldx.b d3
	jsl.l Mul16U
	lda.b $08
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	lda.b d3
	cmp.w #$00FB
	bcs .2x
	lsr.b d0
.2x:
	lda.b d0
	cmp.w #$0088
	bcc .3x
	lda.w #$0088
	sta.b d0
.3x:
	pha
	jsl.l randomd0s
	adc.b $03,s
	sta.b $03,s
	lda.b $01,s
	sta.b d0
	cmp.w #$003D
	bcc .4x
	lda.w #$003C
	sta.b d0
	sta.b $01,s
.4x:
	lda.b $05,s
	bpl .5x
	lsr.b d0
.5x:
	jsl.l randomd0sd0
	lda.b $05,s
	adc.b d0
	sta.b $05,s
	pla
	lsr a
	jsl.l randoma
	adc.b $05,s
	sta.b $05,s
.6:
	ldx.w passspeed
	lda.w #$0044
	jsl.l Mul8XS
	plx
	jsl.l Mul16S
	lda.b d3
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w puckvx
	ldx.w passspeed
	lda.w #$0044
	jsl.l Mul8XS
	plx
	jsl.l Mul16S
	lda.b d3
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w puckvy
	ldx.b $E4
	pla
	beq .7
	tax
	lda.w passspeed
	jsl.l Mul16x8U
	ldx.b $08
	lda.w #$0044
	jsl.l Mul16x8U
	lda.b d3
	sta.b $04
	jsl.l Div32U
	lda.b $00
	asl a
	sta.b d1
	lda.w #$0B33
	ldx.b d3
	jsl.l Mul16U
	lda.w passspeed
	sta.b $04
	jsl.l Div32U
	ldx.b $E4
	lda.b $00
	lsr a
	adc.b d1
	cmp.w #$1801
	bcc .1xx
	lda.w #$1800
.1xx:
	sta.w $0E01
.7:
	pla
	jsl.l PuckSfx
	ldx.b a3
	ldy.w #$0108
	lda.w pfgoal,x
	bne .1xxx
	ldy.w #$FEF8
.1xxx:
	sty.b tmp0
	tya
	sec
	sbc.w pucky
	eor.w puckvy
	bpl .2xx
	lda.w #$0000
	sec
	sbc.w puckvy
	sta.w puckvy
.2xx:
	lda.w $163A
	beq .rtl
	lda.w #$0012
	sta.b d0
	jsl.l assreplace
.rtl:
	rtl
