; Copy part of map [$0C] into the screen map in video memory at column X, row Y
MapPartToVRAM:
	cpx.w #$0020
	bcc .1
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
.1:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	asl a
	pha
	ldx.b $26
	jsl.l Mul16U
	asl.b $24
	lda.w $0761
	bmi .t1
	jmp.w .5

.t1:
	lda.b $0C
	clc
	adc.w #$0006
	adc.b $24
	adc.b $08
	tax
	pla
	sta.b $24
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
.2:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .4
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
.3:
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $24
	tax
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1x
	tya
	clc
	adc.w $079E
	tay
.1x:
	dec.b $1A
	bne .2
	rtl
.4:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	lda.b $18
	asl a
	sec
	sbc.b $20
	sta.w DAS1L
	txa
	clc
	adc.b $20
	sta.w A1T1L
	tya
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	jmp.w .3
.5:
	lda.b $0C
	clc
	adc.w #$0006
	adc.b $24
	adc.b $08
	sta.b $0C
	pla
	sta.b $24
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
.1xx:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .3x
	lda.b $18
	asl a
	tax
	phy
	lda.b $0C
	pha
	jsl.l QueueVRAMDMA
	pla
	sta.b $0C
	ply
.2x:
	lda.b $0C
	clc
	adc.b $24
	sta.b $0C
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1xxx
	tya
	clc
	adc.w $079E
	tay
.1xxx:
	dec.b $1A
	bne .1xx
	rtl
.3x:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	lda.b $0C
	pha
	phy
	jsl.l QueueVRAMDMA
	ply
	lda.b $18
	asl a
	sec
	sbc.b $20
	tax
	phy
	tya
	adc.w #$0400
	and.w #$FFE0
	tay
	jsl.l QueueVRAMDMA
	ply
	pla
	sta.b $0C
	jmp.w .2x
