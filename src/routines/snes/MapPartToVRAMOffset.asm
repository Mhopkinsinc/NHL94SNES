; Copy part of map [$0C] into the screen map at column X, row Y, adding A to each entry
MapPartToVRAMOffset:
	sta.b $16
	lda.w IniDispShadow-1
	bmi .t1
.1:
	jmp.w MapPartToVRAMOffset

.t1:
	cpx.w #$0020
	bcc .2
.1x:
	txa
	and.w #$001F
	tax
	lda.w MapVRAM
	clc
	adc.w #$0400
	sta.w MapVRAM
.2:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	asl a
	pha
	ldx.b $26
	jsl.l Mul16U
	asl.b $24
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
	adc.w MapVRAM
	ora.b $1C
	tax
.3:
	stx.w VMADDL
	phx
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .5
	ldx.b $18
	ldy.w #$0000
.loop:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loop
.4:
	lda.b $0C
	clc
	adc.b $24
	sta.b $0C
	pla
	clc
	adc.w #$0020
	tax
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .2x
.1xx:
	txa
	clc
	adc.w MapScreenStep
	tax
.2x:
	dec.b $1A
	bne .3
	rtl
.5:
	lda.w #$0020
	sbc.b $1C
	sta.b $20
	tax
	ldy.w #$0000
.loopx:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loopx
	lda.b $01,s
	clc
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	lda.b $18
	sec
	sbc.b $20
	tax
.loop2:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loop2
	jmp.w .4
