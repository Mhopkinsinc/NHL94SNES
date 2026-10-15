; Draw the crowd sprites
showcrowd:
	lda.w sflags
	and.w #$0800
	beq .t1
	lda.w $0CB9
	bne .t1
	rtl

.t1:
	jsl.l UpdateHatTrick
	ldx.w #$0022
	lda.w HomeTeam
	cmp.w #$0013
	bne .2
	lda.w $0C53
	bne .1
	lda.w $0CC3
	cmp.w #$0002
	bne .2
.1:
	ldx.w #$0028
.2:
	stx.b $08
	cpx.w #$0000
	beq .1x
	cpx.w #$000A
	bne .t2
.1x:
	lda.w $0C53
	beq .t2
	jmp.w .5

.t2:
	lda.w #$009B
	sta.b $12
	lda.l CrowdAnimTable,x
	sta.b $10
	lda.w $0C2B,x
	beq .t1x
org $9BA000
	jmp.w .9

.t1x:
	cpx.w #$0026
	beq .5
	cpx.w #$0024
	beq .5
	cpx.w #$0022
	beq .4
	cpx.w #$0020
	beq .6
	cpx.w #$0028
	beq .3
	ldy.w #$0008
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	cmp.l crowdlevel
	beq .1xx
	bcs .5
.1xx:
	jsl.l RandomWord
	and.w #$03F0
	bne .5
.3:
	lda.w #$000A
	sta.w $0C2B,x
	tay
	stz.w $0C55,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	bra .7
.4:
	lda.w puckz
	cmp.w #$001A
	bmi .5
	asl a
	adc.w puckz
	clc
	adc.w pucky
	cmp.w #$FEB8
	bpl .5
	cmp.w #$FEB0
	bmi .5
	lda.w puckx
	cmp.w #$FFF4
	bpl .5
	cmp.w #$FFEC
	bmi .5
	bra .3
.5:
	jmp.w .8
.6:
	lda.w puckz
	cmp.w #$001A
	bmi .5
	asl a
	adc.w puckz
	clc
	adc.w pucky
	cmp.w #$FE98
	bpl .5
	cmp.w #$FE90
	bmi .5
	lda.w puckx
	cmp.w #$FFFD
	bpl .5
	cmp.w #$FFF4
	bmi .5
	bra .3
.7:
	ldy.w #$0006
	lda.b [$10],y
	asl a
	adc.b [$10],y
	sta.w $0C7F,x
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi .5
	tax
	lda.b [$10]
	jsl.l Mul8U
	ldy.w #$0004
	clc
	adc.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #CrowdTiles
	sta.b $0C
	lda.w #CrowdTiles>>16
	sta.b $0E
	ldy.w #$0002
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	lda.b [$10]
	asl a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l DMAToVRAM
	ldx.b $08
	cpx.w #$0028
	bne .8
	lda.w $0C51
	bne .8
	lda.w #$000A
	sta.w $0C4F
	sta.w $0C51
	stz.w $0CA3
	stz.w $0CA5
.8:
	ldx.b $08
	dex
	dex
	bmi .t1xx
	jmp.w .2

.t1xx:
	rtl
.9:
	lda.w $0C7F,x
	sec
	sbc.w $0ADB
	sta.w $0C7F,x
	bpl .8
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi .t1xxx
	iny
	iny
	lda.b [$0C],y
	bmi .t1xxx
	tya
	sta.w $0C55,x
	jmp.w .7

.t1xxx:
	lda.w $0C2B,x
	cmp.w #$000E
	bne .t2x
	stz.w $0C2B,x
	bra .8

.t2x:
	cpx.w #$0024
	beq .1xxx
	cpx.w #$0026
	bne .t1xxxx
.1xxx:
	lda.w $0C53
	sta.w $0C2B,x
	bra .2x

.t1xxxx:
	cmp.w #$000C
	beq .3x
	lda.w #$000C
	sta.w $0C2B,x
.2x:
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	stz.w $0C55,x
	jmp.w .7
.3x:
	jsl.l RandomWord
	and.w #$00C0
	bne .2x
	lda.w #$000E
	sta.w $0C2B,x
	bra .2x
