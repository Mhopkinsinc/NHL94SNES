; Copy map [$0C] (width, height) into the screen map in video memory at column X, row Y
MapToVRAM:
	stx.b $1C
	sty.b $1E
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
	tax
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	lda.w $0761
	bmi .t1
	jmp.w .4

.t1:
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
.1:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .3
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
.2:
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $18
	adc.b $18
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
	bne .1
	rtl
.3:
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
	jmp.w .2
.4:
	stx.b $0C
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
	jsl.l QueueVRAMDMA
	ply
.2x:
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
	jmp.w .2x
