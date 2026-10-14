; Unidentified routine.
CODE_9DDDB3:
	lda.b a2
	pha
	lda.l $7E3454
	sta.b $00
	bpl .t1
	lda.l $7E3452
	bpl .1
	lda.w #$0002
	sta.b a2
.1:
	lda.l $7E345C
	ldx.w #$0001
	ldy.w #$0001
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0001
	lda.w #$0000
	jsl.l CODE_808E2D
	bra .2

.t1:
	lda.l $7E3454
	asl a
	asl a
	tax
	lda.l LogoPaletteTable+2,x
	sta.b $0E
	lda.l LogoPaletteTable,x
	sta.b $0C
	ldy.w #$00A0
	ldx.w #$0010
	jsl.l SetColours
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	lda.w #$2400
	ldx.w #$000C
	ldy.w #$000C
	jsl.l DrawSprite
	ldx.w #$0001
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
	ldx.w #$0001
	ldy.w #$0001
	lda.w #$0000
	jsl.l CODE_808E2D
.2:
	lda.l $7E3452
	sta.b $00
	bpl .t1x
	lda.l $7E3454
	bpl .1x
	stz.b a2
.1x:
	lda.l $7E345A
	ldx.w #$0018
	ldy.w #$0001
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
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
	bra .3

.t1x:
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
	jsl.l SetColours
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
.3:
	lda.l $7E3478
	bne .5
	lda.l $7E3454
	bmi .1xx
	lda.l $7E3452
	bpl .t1xx
.1xx:
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
	jsl.l DMAToVRAM
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
	jsl.l DMAToVRAM
	bra .4

.t1xx:
	jsl.l WaitFrame
.4:
	jsl.l CODE_9DD938
	jsl.l CODE_9DD962
.5:
	pla
	sta.b a2
	rtl
