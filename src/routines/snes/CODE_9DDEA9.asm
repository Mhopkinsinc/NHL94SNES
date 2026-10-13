; Unidentified routine.
CODE_9DDEA9:
	lda.l $7E3452
	asl a
	asl a
	tax
	lda.l LogoPaletteTable+2,x
	sta.b $0E
	lda.l LogoPaletteTable,x
	sta.b $0C
	ldy.w #$00B0
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	lda.w #$2600
	ldx.w #$00C4
	ldy.w #$000C
	jsl.l DrawSprite
	ldx.w #$0018
	ldy.w #$0001
	jsl.l CODE_9DCCBA
	lda.w #$007F
	sta.b $0E
	lda.w #$7700
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0018
	ldy.w #$0001
	lda.w #$0000
	jsl.l CODE_808E2D
CODE_9DDF0D:
	lda.l $7E3478
	bne CODE_9DDF6F
	lda.l $7E3454
	bmi CODE_9DDF1F
	lda.l $7E3452
	bpl CODE_9DDF63
CODE_9DDF1F:
	lda.w #$007F
	sta.b $0E
	lda.l $7E3470
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2000
	tay
	ldx.w #$0600
	jsl.l WaitFrame
	jsl.l CODE_80891F
	lda.w #$007F
	sta.b $0E
	lda.l $7E3472
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2300
	tay
	ldx.w #$0600
	jsl.l CODE_80891F
	bra CODE_9DDF67
