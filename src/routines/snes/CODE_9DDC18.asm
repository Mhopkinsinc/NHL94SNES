; Unidentified routine.
CODE_9DDC18:
	sbc.w #$0021
	sta.l $7E3454
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_938000
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AB7A1
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	sec
	sbc.w #$0008
	tay
	lda.b $10
	clc
	adc.w #$0006
	sta.b $10
CODE_9DDC6E:
	lda.b [$10],y
	beq CODE_9DDC85
	clc
	adc.l $7E35B4
	clc
	adc.l $7E35AC
	clc
	adc.w #$0800
	tyx
	sta.l $7E3FF4,x
CODE_9DDC85:
	dey
	dey
	bpl CODE_9DDC6E
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADE57
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.b $0C
	clc
	adc.w #$0020
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE972
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0020
	ldx.w #$0010
	jsl.l CODE_9DE0BD
CODE_9DDCF3:
	sep #$20
	stz.w CGADD
	stz.w CGDATA
	stz.w CGDATA
	rep #$20
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE121
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0030
	ldx.w #$0020
	jsl.l CODE_9DE0BD
	lda.l $7E35BE
	clc
	adc.w #$1400
	sta.l $7E35BE
	lda.l $7E35C0
	clc
	adc.w #$1000
	sta.l $7E35C0
	lda.w HomeTeam
	cmp.w #$0018
	bcs CODE_9DDD4E
	stz.b a2
CODE_9DDD4E:
	lda.w VisTeam
	cmp.w #$0018
	bcs CODE_9DDD5B
	lda.w #$0002
	sta.b a2
CODE_9DDD5B:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AD3B6
	sta.b $0C
	ldy.w #$0080
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AF15C
	sta.b $0C
	ldy.w #$00C0
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	jsl.l CODE_9DD977
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	ldx.w #$0000
	ldy.w #$0180
	lda.w #$6000
	jsl.l InitSprites
	jsl.l SpriteFrameStart
	jsl.l CODE_9DDF73
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DDDB3
	pla
	sta.b a2
	rtl
