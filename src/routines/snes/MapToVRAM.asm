; Copy map [p0] (width, height) into the screen map in video memory at column X, row Y
MapToVRAM:
	stx.b r5
	sty.b r5+2
	ldy.w #$0000
	lda.b [p0],y
	sta.b r4
	iny
	iny
	lda.b [p0],y
	sta.b r4+2
	lda.b p0
	clc
	adc.w #$0006
	tax
	lda.b r5+2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w MapVRAM
	ora.b r5
	tay
	lda.w IniDispShadow-1
	bmi .t1
	jmp.w .4

.t1:
	sep #$20
	lda.b p0+2
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
.1:
	lda.b r4
	clc
	adc.b r5
	cmp.w #$0021
	bcs .3
	lda.b r4
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
	adc.b r4
	adc.b r4
	tax
	tya
	clc
	adc.w #$0020
	tay
	inc.b r5+2
	lda.b r5+2
	cmp.w #$0020
	bne .1x
	tya
	clc
	adc.w MapScreenStep
	tay
.1x:
	dec.b r4+2
	bne .1
	rtl
.3:
	lda.w #$0020
	sbc.b r5
	asl a
	sta.b r6
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	lda.b r4
	asl a
	sec
	sbc.b r6
	sta.w DAS1L
	txa
	clc
	adc.b r6
	sta.w A1T1L
	tya
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	jmp.w .2
.4:
	stx.b p0
.1xx:
	lda.b r4
	clc
	adc.b r5
	cmp.w #$0021
	bcs .3x
	lda.b r4
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
	inc.b r5+2
	lda.b r5+2
	cmp.w #$0020
	bne .1xxx
	tya
	clc
	adc.w MapScreenStep
	tay
.1xxx:
	dec.b r4+2
	bne .1xx
	rtl
.3x:
	lda.w #$0020
	sbc.b r5
	asl a
	sta.b r6
	tax
	phy
	jsl.l QueueVRAMDMA
	ply
	lda.b r4
	asl a
	sec
	sbc.b r6
	tax
	phy
	tya
	adc.w #$0400
	and.w #$FFE0
	tay
	jsl.l QueueVRAMDMA
	ply
	jmp.w .2x
