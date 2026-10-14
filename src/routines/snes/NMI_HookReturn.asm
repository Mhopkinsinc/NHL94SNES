; Unidentified routine.
NMI_HookReturn:
	rep #$30
	lda.w $07D2
	sta.w VTIMEL
	lda.w $07D4
	sta.w HTIMEL
	sep #$30
	lda.w $0762
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
CODE_8081F1:
	cpx.b $3C
	beq .t1
	lda.w $0100,x
	bmi CODE_808243
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.b $3E
	sec
	sbc.w #$0066
	bcc CODE_80827C
	sbc.w $0104,x
	bcc CODE_80827C
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
	bra CODE_8081F1

.t1:
	jmp.w CODE_8083A5
