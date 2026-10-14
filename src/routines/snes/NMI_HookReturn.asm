; Unidentified routine.
NMI_HookReturn:
	rep #$30
	lda.w $07D2
	sta.w VTIMEL
	lda.w $07D4
	sta.w HTIMEL
	sep #$30
	lda.w IniDispShadow
	sta.w INIDISP
	ldx.b #$00
	txy
.loop:
	txa
	lda.w $07D6,x
	sta.w BG1HOFS,y
	lda.w $07D7,x
	sta.w BG1HOFS,y
	iny
	inx
	inx
	cpx.b #$0C
	bne .loop
	rep #$20
	lda.w $0768
	beq .1
	lda.w #DMA_CGRAM
	sta.w DMAP0
	lda.w $076C
	sta.w A1T0L
	ldx.w $076E
	stx.w A1B0
	lda.w $0768
	sta.w DAS0L
	ldx.w $076A
	stx.w CGADD
	ldx.b #$01
	stx.w MDMAEN
	lda.b $3E
	sec
	sbc.w $0768
	sbc.w #$0048
	sta.b $3E
	stz.w $0768
.1:
	sep #$20
	rep #$10
	ldx.b $3A
.2:
	cpx.b $3C
	beq .t1
	lda.w $0100,x
	bmi .4
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.b $3E
	sec
	sbc.w #$0066
	bcc .5
	sbc.w $0104,x
	bcc .5
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	lda.b #$01
	sta.w MDMAEN
	bra .2

.t1:
	jmp.w NMI_SendOAM
.3:
	jmp.w .7
.4:
	cmp.b #$FD
	beq .6
	bmi .3
.1x:
	rep #$20
	and.w #$00FF
	tay
	lda.b $3E
	sec
	sbc.w #$005C
	bcc .5
	sta.b $3E
	lda.w $0102,x
	sta.w VMADDL
	lda.w $0104,x
	sta.w VMDATAL
	iny
	beq .2x
	lda.w $0106,x
	sta.w VMDATAL
.2x:
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	jmp.w .2
.5:
	stx.b $3A
	jmp.w NMI_Tick
.6:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1808
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0078
	bcc .5
	sbc.w $0104,x
	bcc .5
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	stz.w VMAIN
	lda.b #$01
	sta.w MDMAEN
	lda.b #$80
	sta.w VMAIN
	jmp.w .2
.7:
	cmp.b #$FB
	beq .t2
	bmi .t1x
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1908
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0079
	bcc .5
	sbc.w $0104,x
	bcc .5
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	lda.b #$01
	sta.w MDMAEN
	jmp.w .2

.t1x:
	jmp.w .9

.t2:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1800
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$007D
	bcc .8
	sbc.w $0104,x
	bcc .8
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	stz.w VMAIN
	lda.b #$01
	sta.w MDMAEN
	lda.b #$80
	sta.w VMAIN
	jmp.w .2
.8:
	jmp.w .5
.9:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1900
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$007D
	bcc .8
	sbc.w $0104,x
	bcc .8
	sta.b $3E
	lda.w $0102,x
	sta.w A1T0H
	lda.w $0104,x
	sta.w DAS0L
	lda.w $0106,x
	sta.w VMADDL
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	lda.b #$01
	sta.w MDMAEN
	jmp.w .2
