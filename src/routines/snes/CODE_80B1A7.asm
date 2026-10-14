; Unidentified routine.
CODE_80B1A7:
	lda.w SpritesLeft
	beq CODE_80B1A5
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
	bmi .t1
.1:
	jmp.w CODE_80B27A

.t1:
	sta.b $26
	lda.w $07CE
	beq .t2
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B1FD

.t2:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
CODE_80B1FD:
	cmp.w #$0100
	bpl CODE_80B27A
	cmp.w #$FFF0
	bmi CODE_80B27A
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
	bpl .t2
	lda.w $07CE
	beq .t1
	lda.w $0000,y
	ora.w $E688,x
	bra CODE_80B256

.t1:
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E680,x
	bra CODE_80B256

.t2:
	lda.w $07CE
	beq .t1x
	lda.w $0000,y
	and.w $E67C,x
	ora.w $E684,x
	bra CODE_80B256

.t1x:
	lda.w $0000,y
	and.w $E67C,x
CODE_80B256:
	sta.w $0000,y
	rep #$20
	dec.w SpritesLeft
	dex
	bpl .t1
	lda.w #$0003
	sta.w OAMHiShift
	inc.w OAMHiPtr
	bra CODE_80B26F

.t1:
	stx.w OAMHiShift
CODE_80B26F:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B27A:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B284
	jmp.w CODE_80B1A7
