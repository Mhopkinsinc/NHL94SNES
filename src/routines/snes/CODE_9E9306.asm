; Unidentified routine.
CODE_9E9306:
	ldy.b a2
	cpy.w #$0018
	beq .t1
	lda.b d3
	sec
	sbc.w $0D3D
	cmp.w #$FF16
	bpl CODE_9E9305
	bra .8

.t1:
	lda.b d3
	clc
	adc.w $0D3D
	cmp.w #$00EA
	bmi CODE_9E9305
.8:
	lda.b d2
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sec
	sbc.w $0D3B
	cmp.w #$0040
	bpl CODE_9E9305
	lda.b d3
	pha
	sec
	sbc.w Ypos,y
	sta.b d3
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d2
	pha
	sec
	sbc.w Xpos,y
	sta.b d1
	sta.b $04
	tax
	jsl.l Mul8S
	sta.b $08
	ldx.b a3
	lsr a
	lsr a
	cmp.w #$0101
	bcs .2
	sta.b d2
	lda.b d3
	sta.b $06
	tax
	jsl.l Mul8S
	asl a
	sta.b $0A
	ldx.b a3
	clc
	adc.b d2
	cmp.w #$0101
.2:
	bcs .7
	pla
	sta.b d2
	pla
	sta.b d3
	jsr.w .t1x
	lda.b d3
	pha
	lda.b d2
	pha
	lda.b $04
	ldy.b $06
	jsl.l ApproxLength
	inc a
	sta.b d2
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi .3
	lda.w #$00FF
.3:
	cmp.w #$FF01
	bpl .4
	lda.w #$FF01
.4:
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi .5
	lda.w #$00FF
.5:
	cmp.w #$FF01
	bpl .6
	lda.w #$FF01
.6:
	sta.b d1
	ldx.b a3
	jsl.l CODE_9E8F42
.7:
	pla
	sta.b d2
	pla
	sta.b d3
	rtl

.t1x:
	lda.b d0
	pha
	lda.b d1
	pha
	lda.w $0792
	and.w #$01C0
	bne .1x
	lda.w SPA,x
	cmp.w #SPAburst
	bne .1x
	ldy.b a2
	lda.w pucky
	sec
	sbc.w Ypos,y
	cmp.w #$FF80
	bmi .1x
	cmp.w #$0080
	bpl .1x
	lda.w $0EC3,x
	sta.b d0
	lda.w $0EE3,x
	sta.b d1
	cmp.w #$DFFF
	bmi .10
	cmp.w #$2001
	bpl .10
	lda.b d0
	cmp.w #$DFFF
	bmi .10
	cmp.w #$2001
	bpl .10
.1x:
	pla
	sta.b d1
	pla
	sta.b d0
.9:
	rts
.10:
	pla
	pla
	lda.b d0
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .1xx
	ora.w #$E000
.1xx:
	sta.b d0
	cmp.w #$8000
	ror a
	clc
	adc.b d0
	sta.b d0
	ldy.b a2
	sta.w $0EC3,y
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2x
	ora.w #$E000
.2x:
	sta.b d1
	cmp.w #$8000
	ror a
	clc
	adc.b d1
	sta.b d1
	sta.w $0EE3,y
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$0040
	tsb.w sflags
	lda.w gmclock
	bne .9
	pla
	lda.w #$0008
	sta.b d0
	jmp.w AddPenalty2
