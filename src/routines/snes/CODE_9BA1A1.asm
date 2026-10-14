; Unidentified routine.
CODE_9BA1A1:
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
CODE_9BA1B8:
	stx.b d4
	lda.l $7E340C,x
	beq .t3
	jmp.w CODE_9BA31C

.t3:
	jsl.l RandomWord
	and.w #$07C0
	beq .t1
	jmp.w CODE_9BA312

.t1:
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
	bra CODE_9BA249

.t2:
	lda.w #$FF00
	sta.l $7E3394,x
	lda.b d0
	sec
	sbc.w #$FF00
CODE_9BA249:
	tax
	lda.b d2
	jsl.l DivX8S
	ldx.b d4
	sta.l $7E33D0,x
	lda.b d2
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b d4
	sta.b d2
	asl a
	adc.b d2
	sta.l $7E33BC,x
	jsl.l RandomWord
	lsr a
	lsr a
	and.w #$0003
	beq .1
	dec a
.1:
	sta.b d2
	asl a
	adc.b d2
	sta.l $7E3434,x
	lda.w #$0000
	sta.l $7E33F8
	inc a
	sta.l $7E340C,x
	lda.l DATA8_9BA414,x
	sta.l $7E3420,x
CODE_9BA293:
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
	beq .1
	ora.w #$F000
.1:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .2
	ora.w #$F000
.2:
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
CODE_9BA312:
	ldx.b d4
	dex
	dex
	bmi .t1
	jmp.w CODE_9BA1B8

.t1:
	rtl
