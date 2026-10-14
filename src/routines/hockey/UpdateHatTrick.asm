; While $7E3448 is set (not in horizontal mode or a replay): launch and move the ten hat trick sprites on random arcs and draw them
UpdateHatTrick:
	lda.w sfhormode
	bne .rtl
	lda.w sflags
	and.w #$0800
	bne .rtl
	lda.l $7E3448
	bne .t1
.rtl:
	rtl

.t1:
	ldx.w #$0012
.1:
	stx.b d4
	lda.l $7E340C,x
	beq .t3
	jmp.w .7

.t3:
	jsl.l RandomWord
	and.w #$07C0
	beq .t1x
	jmp.w .6

.t1x:
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
	beq .t2
	lda.w #$1100
	sta.l $7E3394,x
	lda.b d0
	sec
	sbc.w #$1100
	bra .2

.t2:
	lda.w #$FF00
	sta.l $7E3394,x
	lda.b d0
	sec
	sbc.w #$FF00
.2:
	tax
	lda.b d2
	jsl.l DivX8S
	ldx.b d4
	sta.l $7E33D0,x
	lda.b d2
	lsr a
	lsr a
	tax
	jsl.l Mul8U
	ldx.b d4
	sta.b d2
	asl a
	adc.b d2
	sta.l $7E33BC,x
	jsl.l RandomWord
	lsr a
	lsr a
	and.w #$0003
	beq .1x
	dec a
.1x:
	sta.b d2
	asl a
	adc.b d2
	sta.l $7E3434,x
	lda.w #$0000
	sta.l $7E33F8
	inc a
	sta.l $7E340C,x
	lda.l .9,x
	sta.l $7E3420,x
.5:
	lda.l $7E3434,x
	clc
	adc.l $7E340C,x
	clc
	adc.w #$03C5
	sta.b $00
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.l $7E33BC,x
	lsr a
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .1xx
	ora.w #$F000
.1xx:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .2x
	ora.w #$F000
.2x:
	tax
	lda.w #$2000
	jsl.l DrawSprite
	ldx.b d4
	lda.w #$03CF
	sta.b $00
	lda.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .3
	ora.w #$F000
.3:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .4
	ora.w #$F000
.4:
	tax
	lda.w #$2000
	jsl.l DrawSprite
.6:
	ldx.b d4
	dex
	dex
	bmi .t1xx
	jmp.w .1

.t1xx:
	rtl
.7:
	lda.l $7E3420,x
	sec
	sbc.w $0ADB
	bpl .t1xxx
	clc
	adc.l .9,x
	sta.l $7E3420,x
	lda.l $7E340C,x
	inc a
	cmp.w #$0004
	bne .1xxx
	lda.w #$0001
.1xxx:
	sta.l $7E340C,x
	bra .8

.t1xxx:
	sta.l $7E3420,x
.8:
	ldy.w $0ADB
	beq .1xxxx
.loop:
	jsl.l .t3x
	dey
	bne .loop
.1xxxx:
	jmp.w .5

.t3x:
	lda.l $7E33D0,x
	ora.l $7E33E4,x
	beq .rtlx
	lda.l $7E3394,x
	clc
	adc.l $7E33D0,x
	sta.l $7E3394,x
	lda.l $7E33A8,x
	clc
	adc.l $7E33E4,x
	sta.l $7E33A8,x
	lda.l $7E33BC,x
	beq .t2x
	lda.l $7E33F8,x
	lsr a
	lsr a
	bit.w #$2000
	beq .1xxxxx
	ora.w #$C000
.1xxxxx:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33BC,x
	bmi .t1xxxx
	sta.l $7E33BC,x
	lda.l $7E33F8,x
	clc
	adc.w #$0006
	sta.l $7E33F8,x
.rtlx:
	rtl

.t1xxxx:
	lda.w #$0000
	sta.l $7E33BC,x
	rtl

.t2x:
	lda.w #$0000
	sta.l $7E33F8,x
	sta.l $7E33BC,x
	lda.w #$03E8
	sta.l $7E3420,x
	lda.l $7E33D0,x
	cmp.w #$0010
	bcc .t1xxxxx
	cmp.w #$FFF0
	bcs .t1xxxxx
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .1xxxxxx
	ora.w #$F000
.1xxxxxx:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33D0,x
	sta.l $7E33D0,x
	lda.l $7E33E4,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .2xx
	ora.w #$F000
.2xx:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33E4,x
	sta.l $7E33E4,x
	rtl

.t1xxxxx:
	lda.w #$0000
	sta.l $7E33D0,x
	sta.l $7E33E4,x
	rtl
.9:
	dw $0004,$0008,$0009,$000F,$000C,$000D,$000A,$0007,$000B,$000E
