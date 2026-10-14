; Collision of object X with the corners, the goals and the boards
checkwallcoll:
	lda.w #$012A
	sec
	sbc.w $0D3D
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b d5
	lda.w #$0088
	sec
	sbc.w $0D3B
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b d4
	lda.b d3
	pha
	ldy.b d2
	phy
	dec a
	cmp.b d5
	bpl .t1
	lda.b d2
	cmp.b d4
	bmi .t2
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi .t2
	lda.w #$001A
	sta.b a2
	jsl.l CODE_9E90AE
	jmp.w .6

.t1:
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
	cmp.b d3
	bpl .1
	lda.b d2
	cmp.b d4
	bmi .t2
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi .t2
	lda.w #$0018
	sta.b a2
	jsl.l CODE_9E90AE
.1:
	jmp.w .6

.t2:
	lda.b d2
	sec
	sbc.b d4
	sta.b d2
	eor.w #$FFFF
	inc a
	sta.b d1
	bit.w #$8000
	beq .1x
	eor.w #$FFFF
	inc a
.1x:
	sta.b $CD
	lda.b d3
	sec
	sbc.b d5
	sta.b d0
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	sta.b $D7
	cmp.b $CD
	bcc .t1x
	lda.b $CD
	lsr a
	lsr a
	adc.b $D7
	bra .5

.t1x:
	lsr a
	lsr a
	adc.b $CD
.5:
	cmp.w #$0041
	bcc .6
	sta.b d3
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	cmp.w #$FF01
	bpl .1xx
	lda.w #$FF01
.1xx:
	cmp.w #$00FF
	bmi .2x
	lda.w #$00FF
.2x:
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	ldx.b a3
	cmp.w #$FF01
	bpl .3
	lda.w #$FF01
.3:
	cmp.w #$00FF
	bmi .4
	lda.w #$00FF
.4:
	sta.b d1
	jsl.l CODE_9E8E91
.6:
	pla
	sta.b d2
	pla
	sta.b d3
	pla
	sta.b d4
	pla
	sta.b d5
	lda.w $1103,x
	ora.w $1123,x
	bne .rtl
	lda.w #$00FF
	sta.b d0
	stz.b d1
	lda.b d3
	dec a
	cmp.b d5
	bpl CODE_9E8E91
	lda.w #$FF01
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d5
	dec a
	cmp.b d3
	bpl CODE_9E8E91
	stz.b d0
	lda.w #$FF01
	sta.b d1
	lda.b d2
	dec a
	cmp.b d4
	bpl CODE_9E8E91
	lda.w #$00FF
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d4
	dec a
	cmp.b d2
	bpl CODE_9E8E91
.rtl:
	rtl
