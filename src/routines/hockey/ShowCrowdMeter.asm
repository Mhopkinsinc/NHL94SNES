; Crowd meter screen
ShowCrowdMeter:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l SetupScreen
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C8328
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
	ldy.w #$0050
	ldx.w #$0010
	jsl.l SetColours
	jsl.l SendColours
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF163
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0014
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8091
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96D7AC
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
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.b $10
	sta.b $0C
	tax
	lda.l $7E35C4
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	jsl.l DMAToVRAM
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACFB6
	sta.b $0C
	ldy.w #$0070
	ldx.w #$0010
	jsl.l SetColours
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l SendColours
	stz.w $1DB9
	jsl.l ScreenOn
.1:
	jsl.l SpriteFrameStart
	ldx.w #$0048
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #CrowdMeter
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l CODE_9DDDB3
	jsl.l .6
	jsl.l SpriteFrameEnd
.2:
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne .t1
	bit.w #$0800
	bne .t2
	bit.w #$0400
	bne .t3
	bra .2

.t1:
	rtl

.t2:
	lda.w $1DB9
	dec a
	bmi .2
	sta.w $1DB9
	bra .1

.t3:
	lda.w $1DB9
	inc a
	cmp.w #$0003
	bcs .2
	sta.w $1DB9
	bra .1
.6:
	lda.w $1DB9
	beq .t1x
.1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF175
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF181
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2x

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF188
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF194
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2x:
	lda.w #$0014
	sta.w printx
	lda.w #$0011
	sta.w printy
	lda.w $19C2
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	cmp.w #$0001
	beq .t1xx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF19B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1A4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .3

.t1xx:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1AB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1B4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.3:
	lda.w #$0014
	sta.w printx
	lda.w #$0013
	sta.w printy
	lda.w $19C4
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	cmp.w #$0002
	beq .t1xxx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1BB
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1C7
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .4

.t1xxx:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1CE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1DA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.4:
	lda.w #$0014
	sta.w printx
	lda.w #$0015
	sta.w printy
	lda.w $19C6
	sta.b d0
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.w $1DB9
	beq .t2x
.1xx:
	cmp.w #$0001
	beq .t1xxxx
	lda.w $19C6
	bra .5

.t1xxxx:
	lda.w $19C4
	bra .5

.t2x:
	lda.w $19C2
.5:
	jsl.l .8
	rtl
.7:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	sta.b $0C
.loop:
	ldx.w $1DD1
	ldy.w #$0000
.loop2:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne .loop2
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne .loop
	rtl
.8:
	sec
	sbc.w #$0032
	bpl .1xxx
	lda.w #$0000
.1xxx:
	lsr a
	lsr a
	sta.b $04
	cmp.w #$0013
	bmi .t1xxxxx
.2xx:
	lda.w #$0000
	sta.b $04
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADFCB
	sta.b $0C
	bra .3x

.t1xxxxx:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE919
	sta.b $0C
.3x:
	lda.b $04
	pha
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l PasteMap
	jsl.l WaitFrame
	pla
	sta.b $04
	sta.w $1DD1
	beq .rtl
.1xxxx:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE8EC
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
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l .7
.rtl:
	rtl
.9:
	db $EF,$E7,$E3,$E0
.10:		; records of a byte and a pointer into .9; $00 ends them
	db $0C : dw .9+3
	db $06 : dw .9+2
	db $1C : dw .9+1
	db $08 : dw .9
	db $22 : dw .9+3
	db $18 : dw .9+1
	db $14 : dw .9+3
	db $00
.11:
	lda.w $19CE
	bne .rtlx
	ldy.w #$0033
	ldx.w #$0000
.loopx:
	sep #$20
	lda.w $1A13,x
	inc a
	inc a
	sta.w $1A13,x
	lda.w $1A12,x
	inc a
	inc a
	sta.w $1A12,x
	lda.w $1A15,x
	inc a
	inc a
	sta.w $1A15,x
	lda.w $1A14,x
	inc a
	inc a
	sta.w $1A14,x
	rep #$20
	txa
	clc
	adc.w #$000C
	tax
	dey
	bpl .loopx
	inc.w $19CE
.rtlx:
	rtl
