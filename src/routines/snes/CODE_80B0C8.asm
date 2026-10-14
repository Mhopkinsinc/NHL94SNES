; Unidentified routine.
CODE_80B0C8:
	ldy.w #$0016
	lda.b $14
	bit.w #$8000
	beq .t1
	jmp.w CODE_80B286

.t1:
	bit.w #$4000
	beq .2
	jmp.w CODE_80B1A7
.2:
	lda.w SpritesLeft
	beq CODE_80B0C6
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	sta.w $07CC
	iny
	iny
	lda.b [$0C],y
	and.w #$00FF
	sta.w $07CE
	iny
	sty.w $07D0
	lda.w $07CA
	clc
	adc.b $1E
	cmp.w #$FFF0
	bmi .1
	cmp.w #$00E0
	bmi .t2
.1:
	jmp.w .5

.t2:
	sta.b $26
	lda.w $07C8
	clc
	adc.b $1C
	cmp.w #$0100
	bpl .5
	cmp.w #$FFF0
	bmi .5
	sta.b $20
	sta.w $0000,x
	lda.b $26
	sta.w $0001,x
	lda.w $07CC
	clc
	adc.b $16
	eor.b $14
	sta.w $0002,x
	ldy.w OAMHiPtr
	ldx.w OAMHiShift
	sep #$20
	lda.b $21
	bpl .t3
	lda.w $07CE
	beq .t1x
	lda.w $0000,y
	ora.w $E688,x
	bra .3

.t1x:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra .3

.t3:
	lda.w $07CE
	beq .t1xx
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra .3

.t1xx:
	lda.w $0000,y
	and.w $E67C,x
.3:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1xxx
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra .4

.t1xxx:
	stx.w OAMHiShift
.4:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
.5:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B1A5
	jmp.w .2
