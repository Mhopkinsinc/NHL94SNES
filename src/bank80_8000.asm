; Bank $80, first 4 KB: the reset, NMI and IRQ entry points and the low-level services the rest of the game leans on.
; Reset puts the CPU in native mode, clears the PPU, CPU I/O and all of WRAM, seeds the interrupt hooks and the random
; seed, then hands over to the game. The NMI drains the VRAM DMA queue, scroll and palette shadows each frame and calls
; the per-frame hook; the IRQ calls the raster hook. After them come the frame waits, the hook setters, the random
; number generator, the joypad direction lookup and the tile map, palette and fill helpers.

org $808000
Mode7Identity:		; M7A-M7D written low byte then high byte: the identity matrix
	db $01,$00,$00,$01,$00,$00
InitHooks:		; initial NMI hook, per-frame hook, IRQ hook (long pointers) and random seed
	dl NullHook&$FFFF,NullHook&$FFFF,IRQHook_Off&$FFFF		; bank $00 mirror
	dw $AFE5,$F527
InitTag:
	db "EACDSI"

NullHook:
	rtl

Reset:
	clc
	xce
	rep #$30
	ldx.w #$1FFF
	txs
	lda.w #$0000
	tcd
	jml.l Reset_Fast

Reset_Fast:
	phk
	plb
	sep #$20
	lda.b #$01
	sta.w MEMSEL
	stz.w NMITIMEN
	lda.b #$8F
	sta.w INIDISP
	stz.w OBSEL
	stz.w OAMADDL
	stz.w OAMADDH
	stz.w OAMDATA
	stz.w OAMDATA
	ldx.w #BGMODE
CODE_80804D:
	stz.b $00,x
	inx
	cpx.w #BG1HOFS
	bne CODE_80804D
CODE_808055:
	stz.b $00,x
	stz.b $00,x
	inx
	cpx.w #VMAIN
	bne CODE_808055
	lda.b #$80
	sta.w VMAIN
	inx
CODE_808065:
	stz.b $00,x
	inx
	cpx.w #M7A
	bne CODE_808065
	ldy.w #$0000
CODE_808070:
	stz.b $00,x
	lda.w Mode7Identity,y
	sta.b $00,x
	iny
	inx
	cpx.w #CGADD
	bne CODE_808070
CODE_80807E:
	stz.b $00,x
	inx
	cpx.w #CGWSEL
	bne CODE_80807E
	lda.b #$30
	sta.w CGWSEL
	stz.w CGADSUB
	lda.b #$E0
	sta.w COLDATA
	stz.w SETINI
	rep #$20
	lda.w #$008F
	sta.w $0762
	lda.w #$0000
	tax
	tay
	jsl.l CODE_8087EA
	sep #$20
	stz.w NMITIMEN
	lda.b #$FF
	sta.w WRIO
	ldx.w #WRMPYA
CODE_8080B4:
	stz.b $00,x
	inx
	cpx.w #HDMAEN
	bne CODE_8080B4
	rep #$20
	lda.w #SoundDriver
	sta.b $0C
	stz.b $0E
	jsl.l SPCIPLUpload
	sep #$20
	rep #$20
	lda.w #$0000
	tax
CODE_8080D1:
	sta.l $7E0000,x
	sta.l $7F0000,x
	dex
	dex
	bne CODE_8080D1
	sep #$20
	ldx.w #$0005
CODE_8080E2:
	lda.w InitTag,x
	sta.w $0796,x
	sta.w $1EBD,x
	sta.l $7EE676,x
	dex
	bpl CODE_8080E2
	ldx.w #$0010
	beq CODE_808102
CODE_8080F7:
	lda.l $80FEFF,x
	sta.l $7EE67B,x
	dex
	bne CODE_8080F7
CODE_808102:
	jsl.l CODE_9F8282
	sep #$20
	rep #$10
	lda.b #$8F
	sta.w $0762
	ldx.w #$000C
CODE_808112:
	lda.w InitHooks,x
	sta.w $0789,x
	dex
	bpl CODE_808112
	ldx.w #$0024
CODE_80811E:
	stz.w $0764,x
	dex
	bpl CODE_80811E
	rep #$20
	lda.w #$0000
	tax
	tay
	jsl.l InitSprites
	sep #$20
	lda.b #$81
	sta.w NMITIMEN
	rep #$30
	jsl.l SoundInit
	stz.w $0AD3
	jsl.l CODE_8086A9
	jml.l CODE_9F8283

NMI:
	jml.l NMI_Fast

NMI_Fast:
	rep #$30
	phb
	phk
	plb
	pha
	cli
	lda.w #$0000
	tcd
	lda.w RDNMI
	lda.b $38
	beq CODE_808160
	pla
	plb
	rti
CODE_808160:
	phx
	phy
	lda.w #$16D3
	sta.b $3E
	sep #$10
	ldx.w $0774
	beq CODE_80817D
	lda.w $0773
	sta.w $078C
	stz.w $0773
	ldx.w $0775
	stx.w $078E
CODE_80817D:
	ldx.b #$80
	phx
	pea.w NMI_HookReturn-1		; rtl from the hook lands on the next line
	jml [$078C]
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
CODE_80819F:
	txa
	lda.w $07D6,x
	sta.w BG1HOFS,y
	lda.w $07D7,x
	sta.w BG1HOFS,y
	iny
	inx
	inx
	cpx.b #$0C
	bne CODE_80819F
	rep #$20
	lda.w $0768
	beq CODE_8081EB
	lda.w #$2200
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
CODE_8081EB:
	sep #$20
	rep #$10
	ldx.b $3A
CODE_8081F1:
	cpx.b $3C
	beq CODE_80823D
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
CODE_80823D:
	jmp.w CODE_8083A5
CODE_808240:
	jmp.w CODE_8082CB
CODE_808243:
	cmp.b #$FD
	beq CODE_808281
	bmi CODE_808240
CODE_808249:
	rep #$20
	and.w #$00FF
	tay
	lda.b $3E
	sec
	sbc.w #$005C
	bcc CODE_80827C
	sta.b $3E
	lda.w $0102,x
	sta.w VMADDL
	lda.w $0104,x
	sta.w VMDATAL
	iny
	beq CODE_80826E
	lda.w $0106,x
	sta.w VMDATAL
CODE_80826E:
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	sep #$20
	jmp.w CODE_8081F1
CODE_80827C:
	stx.b $3A
	jmp.w CODE_8083DD
CODE_808281:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1808
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0078
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
	stz.w VMAIN
	lda.b #$01
	sta.w MDMAEN
	lda.b #$80
	sta.w VMAIN
	jmp.w CODE_8081F1
CODE_8082CB:
	cmp.b #$FB
	beq CODE_808316
	bmi CODE_808313
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1908
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$0079
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
	jmp.w CODE_8081F1
CODE_808313:
	jmp.w CODE_808363
CODE_808316:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1800
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$007D
	bcc CODE_808360
	sbc.w $0104,x
	bcc CODE_808360
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
	jmp.w CODE_8081F1
CODE_808360:
	jmp.w CODE_80827C
CODE_808363:
	lda.w $0101,x
	sta.w A1T0L
	rep #$20
	lda.w #$1900
	sta.w DMAP0
	lda.b $3E
	sec
	sbc.w #$007D
	bcc CODE_808360
	sbc.w $0104,x
	bcc CODE_808360
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
	jmp.w CODE_8081F1
CODE_8083A5:
	stx.b $3A
	rep #$20
	lda.b $3E
	cmp.w #$026E
	bcc CODE_8083DD
	sep #$20
	lda.w OAMReady
	beq CODE_8083DD
	stz.w OAMReady
	lda.b #$7E
	sta.w A1B0
	rep #$20
	lda.w #$0400
	sta.w DMAP0
	lda.w OAMShowBuf
	sta.w A1T0L
	lda.w #$0220
	sta.w DAS0L
	stz.w OAMADDL
	sep #$20
	lda.b #$01
	sta.w MDMAEN
CODE_8083DD:
	rep #$30
	lda.l $7E35D8
	clc
	adc.l $7E35DA
	sta.l $7E35D8
	lda.b $83
	adc.w #$0001
	sta.b $83
	bcc CODE_8083F7
CODE_8083F5:
	inc.b $85
CODE_8083F7:
	lda.w $0AD1
	beq CODE_80843E
	bmi CODE_80841F
	cmp.w #$0001
	bne CODE_808415
	lda.w $0AD3
	cmp.w #$000F
	bcs CODE_808435
	lda.w STAT77
	bmi CODE_80843E
	inc.w $0AD3
	bra CODE_80843E
CODE_808415:
	dec.w $0AD1
	bra CODE_80843E
CODE_80841A:
	inc.w $0AD1
	bra CODE_80843E
CODE_80841F:
	cmp.w #$FFFF
	bne CODE_80841A
	lda.w STAT77
	bmi CODE_80843E
	dec.w $0AD3
	bmi CODE_808430
	bne CODE_80843E
CODE_808430:
	stz.w $0AD3
	bra CODE_80843B
CODE_808435:
	lda.w #$000F
	sta.w $0AD3
CODE_80843B:
	stz.w $0AD1
CODE_80843E:
	rep #$20
	lda.w $0787
	bne CODE_808448
	inc.w $0764
CODE_808448:
	sep #$10
	rep #$20
	ldx.w $0771
	beq CODE_808460
	lda.w $0770
	sta.w $0789
	stz.w $0770
	ldx.w $0772
	stx.w $078B
CODE_808460:
	ldx.b #$80
	phx
	pea.w NMI_FrameHookReturn-1		; rtl from the hook lands on the next line
	jml [$0789]
NMI_FrameHookReturn:
	sep #$30
	jsl.l Multi5Bios
	rep #$20
	jsr.w SoundUpdate
	jsl.l CODE_9C9981
	rep #$30
	stz.b $38
	ply
	plx
	pla
	plb
	rti
BCDTable:		; 0-99 as packed BCD
	db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$10,$11,$12,$13,$14,$15
	db $16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31
	db $32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47
	db $48,$49,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$60,$61,$62,$63
	db $64,$65,$66,$67,$68,$69,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79
	db $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$90,$91,$92,$93,$94,$95
	db $96,$97,$98,$99

IRQ:
	jml.l IRQ_Fast

IRQ_Fast:
	rep #$30
	sei
	phb
	phk
	plb
	pha
	phx
	phy
	sep #$10
	ldx.w TIMEUP
	ldx.b #$80
	phx
	pea.w IRQ_HookReturn-1		; rtl from the hook lands on the next line
	jml [$078F]
IRQ_HookReturn:
	rep #$30
	ply
	plx
	pla
	plb
	rti
CODE_808507:
	sei
	php
	pha
	sep #$20
	lda.b #$81
	sta.w NMITIMEN
	stz.w $0791
	rep #$20
	lda.w #IRQHook_Off
	sta.w $078F
	pla
	plp
	cli
	rtl
CODE_808520:
	php
	sei
	sep #$20
	pha
	lda.b #$81
	sta.w NMITIMEN
	pla
	rep #$20
	sty.w $07D2
	sty.w VTIMEL
	ldy.w $07D4
	sty.w HTIMEL
	sep #$10
	stx.w $0791
	sta.w $078F
	jsl.l WaitFrame
	sep #$20
	lda.b #$B1
	sta.w NMITIMEN
	plp
	cli
IRQHook_Off:
	rtl
CODE_80854F:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l CODE_80855E
	plx
	pla
	rtl
CODE_80855E:
	sep #$10
	stx.w $0772
	sta.w $0770
	rep #$10
	rtl
CODE_808569:
	pha
	phx
	ldx.w #$0080
	lda.w #NullHook
	jsl.l CODE_808578
	plx
	pla
	rtl
CODE_808578:
	sep #$10
	stx.w $0775
	sta.w $0773
	rep #$10
	rtl

WaitFrame:
	pha
	lda.w $0764
CODE_808587:
	cmp.w $0764
	beq CODE_808587
	pla
	rtl

WaitFrames_Inc:
	iny

WaitFrames:
	jsl.l WaitFrame
	dex
	bne WaitFrames
	dey
	bne WaitFrames
	rtl

WaitDMAQueue:
	pha
CODE_80859B:
	lda.b $3A
	cmp.b $3C
	bne CODE_80859B
	pla
	rtl
CODE_8085A3:
	iny
CODE_8085A4:
	jsl.l WaitFrame
	dex
	bne CODE_8085B2
	dey
	bne CODE_8085B2
	lda.w #$0000
	rtl
CODE_8085B2:
	lda.w JoyPad
	beq CODE_8085A4
	rtl
CODE_8085B8:
	iny
CODE_8085B9:
	jsl.l WaitFrame
	dex
	bne CODE_8085C7
	dey
	bne CODE_8085C7
	lda.w #$0000
	rtl
CODE_8085C7:
	lda.w $0778
	beq CODE_8085B9
	rtl
CODE_8085CD:
	sta.b $14
	iny
CODE_8085D0:
	jsl.l WaitFrame
	dex
	bne CODE_8085DE
	dey
	bne CODE_8085DE
	lda.w #$0000
	rtl
CODE_8085DE:
	lda.w JoyPad
	and.b $14
	beq CODE_8085D0
	rtl
CODE_8085E6:
	sta.b $14
	iny
CODE_8085E9:
	jsl.l WaitFrame
	dex
	bne CODE_8085F7
	dey
	bne CODE_8085F7
	lda.w #$0000
	rtl
CODE_8085F7:
	lda.w $0778
	and.b $14
	beq CODE_8085E9
	rtl
CODE_8085FF:
	pha
CODE_808600:
	lda.w JoyPad
	and.w #$FFF0
	bne CODE_808600
	pla
	rtl
CODE_80860A:
	pha
CODE_80860B:
	lda.w $0778
	and.w #$FFF0
	bne CODE_80860B
	pla
	rtl
CODE_808615:
	pha
CODE_808616:
	jsl.l WaitFrame
	lda.w JoyPad
	and.w #$FFF0
	beq CODE_808625
	dex
	bne CODE_808616
CODE_808625:
	pla
	rtl
CODE_808627:
	pha
CODE_808628:
	jsl.l WaitFrame
	lda.w $0778
	and.w #$FFF0
	beq CODE_808637
	dex
	bne CODE_808628
CODE_808637:
	pla
	rtl

JoyDirIndex_Hi:
	xba

JoyDirIndex:
	and.w #$000F
	tax
	lda.l JoyDirTable,x
	and.w #$00FF
	asl a
	tax
	rtl
JoyDirTable:		; up/down/left/right bits to a direction 0-7, 8 = none
	db $08,$02,$06,$08,$04,$03,$05,$08,$00,$01,$07,$08,$08,$08,$08,$08

RandomWord:
	lda.w seed
	beq CODE_808679
	asl a
	bcc CODE_808663
	eor.w #$1D87
CODE_808663:
	sta.w seed
	lda.w $0794
	beq CODE_80867E
	asl a
	bcc CODE_808671
	eor.w #$1D87
CODE_808671:
	sta.w $0794
	clc
	adc.w seed
	rtl
CODE_808679:
	lda.w #$A5A5
	bra CODE_808663
CODE_80867E:
	lda.w #$B4B4
	bra CODE_808671
CODE_808683:
	rtl
CODE_808684:
	jsl.l WaitFrame
	jsl.l CODE_808507
	jsl.l CODE_80854F
	jsl.l CODE_808569
	sep #$20
	lda.b #$8F
	sta.w $0762
	jsl.l WaitFrame
	stz.w HDMAEN
	rep #$20
	lda.b $3A
	sta.b $3C
	rtl
CODE_8086A9:
	lda.w $0AD3
	beq CODE_8086B6
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
CODE_8086B6:
	jsl.l CODE_808684
	jmp.w CODE_8086D5
CODE_8086BD:
	pha
	lda.w $0AD3
	cmp.w #$000F
	beq CODE_8086CA
	jsl.l CODE_9F96E6
CODE_8086CA:
	sep #$20
	lda.b #$0F
	sta.w $0762
	rep #$20
	pla
	rtl
CODE_8086D5:
	pha
	stz.w $07D6
	stz.w $07DA
	stz.w $07DE
	lda.w #$FFFF
	sta.w $07D8
	sta.w $07DC
	sta.w $07E0
	lda.w #$FFF0
	sta.b $30
	sta.b $2C
	lda.w #$00E0
	sta.b $32
	lda.w #$0100
	sta.b $2E
	sep #$20
	stz.w CGADSUB
	stz.w CGWSEL
	stz.w TMW
	stz.w MOSAIC
	stz.w SETINI
	stz.w TS
	stz.w TSW
	stz.w W12SEL
	stz.w W34SEL
	stz.w WOBJSEL
	stz.w $07E2
	rep #$20
	pla
	rtl
CODE_808723:
	sep #$20
	lda.w $0762
	bpl CODE_808751
	tya
	sta.w CGADD
	rep #$20
	txa
	sep #$10
	asl a
	beq CODE_80874E
	sta.w DAS1L
	lda.w #$2200
	sta.w DMAP1
	lda.b $0C
	sta.w A1T1L
	ldx.b $0E
	stx.w A1B1
	ldx.b #$02
	stx.w MDMAEN
CODE_80874E:
	rep #$30
	rtl
CODE_808751:
	sty.w $076A
	rep #$20
	lda.b $0E
	sta.w $076E
	lda.b $0C
	sta.w $076C
	txa
	asl a
	sta.w $0768
	rtl
CODE_808766:
	cmp.w #$0000
	beq CODE_80877D
	cmp.w #$0100
	bne CODE_80878B
	tya
	asl a
	tay
CODE_808773:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808773
	rtl
CODE_80877D:
	lda.w #$0000
	tya
	asl a
	tay
CODE_808783:
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808783
	rtl
CODE_80878B:
	and.w #$00FF
	xba
	sta.b $14
	tya
	asl a
	tay
CODE_808794:
	lda.b [$0C],y
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	xba
	and.w #$001F
	sta.b [$10],y
	lda.b [$0C],y
	asl a
	asl a
	asl a
	xba
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	lsr a
	lsr a
	lsr a
	and.w #$03E0
	ora.b [$10],y
	sta.b [$10],y
	lda.b [$0C],y
	xba
	lsr a
	lsr a
	and.w #$001F
	ora.b $14
	sta.w WRMPYA
	nop
	rep #$20
	lda.w RDMPYL
	asl a
	asl a
	and.w #$7C00
	ora.b [$10],y
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808794
	rtl
CODE_8087EA:
	sta.b $16
	lda.w $0761
	bpl CODE_808820
	stx.w DAS1L
	cpy.w #$0000
	bmi CODE_8087FE
	sty.w VMADDL
	sty.b $14
CODE_8087FE:
	ldy.w #$0016
	sty.w A1T1L
	sep #$20
	lda.b #$09
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl
CODE_808820:
	txa
	ldx.b $3C
CODE_808823:
	pha
	cmp.w #$1001
	bcc CODE_80882C
	lda.w #$1000
CODE_80882C:
	sta.w $0104,x
	lsr a
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$09
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sec
	sbc.w #$1000
	beq CODE_80885F
	bcs CODE_808823
CODE_80885F:
	stx.b $3C
	rtl
CODE_808862:
	sta.b $16
	lda.w $0761
	bpl CODE_8088BA
	txa
	pha
	sta.w DAS1L
	sty.w VMADDL
	sty.b $14
	ldy.w #$0016
	sty.w A1T1L
	lda.w #$1808
	sta.w DMAP1
	sep #$20
	stz.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	pla
	sta.w DAS1L
	clc
	adc.b $14
	pha
	ldy.b $14
	sty.w VMADDL
	ldy.w #$0017
	sty.w A1T1L
	lda.w #$1908
	sta.w DMAP1
	sep #$20
	lda.b #$80
	sta.w VMAIN
	stz.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	ply
	rtl
CODE_8088BA:
	txa
	ldx.b $3C
CODE_8088BD:
	pha
	cmp.w #$1001
	bcc CODE_8088C6
	lda.w #$1000
CODE_8088C6:
	pha
	sta.w $0104,x
	tya
	sta.w $0106,x
	lda.w #$0016
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FD
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.w #$0017
	sta.w $0101,x
	sep #$20
	stz.w $0103,x
	lda.b #$FC
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	pla
	sec
	sbc.w #$1000
	beq CODE_80891C
	bcs CODE_8088BD
CODE_80891C:
	stx.b $3C
	rtl
CODE_80891F:
	lda.w $0761
	bpl CODE_808950
	stx.w DAS1L
	lda.b $0C
	sta.w A1T1L
	lda.w #$1801
	sta.w DMAP1
	cpy.w #$0000
	bmi CODE_80893C
	sty.w VMADDL
	sty.b $14
CODE_80893C:
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl
CODE_808950:
	txa
	ldx.b $3C
CODE_808953:
	sta.b $14
	cmp.w #$1000
	bcc CODE_80895D
	lda.w #$1000
CODE_80895D:
	sta.w $0104,x
	lsr a
	sta.b $16
	tya
	sta.w $0106,x
	clc
	adc.b $16
	tay
	lda.b $0C
	sta.w $0101,x
	clc
	adc.b $16
	adc.b $16
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$01
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	lda.b $14
	sec
	sbc.w #$1000
	beq CODE_808998
	bcs CODE_808953
CODE_808998:
	stx.b $3C
	rtl
CODE_80899B:
	lda.w $0761
	bpl CODE_8089C7
	stx.w DAS1L
	lda.b $0C
	sta.w A1T1L
	lda.w #$1900
	sta.w DMAP1
	sty.w VMADDL
	sty.b $14
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	lsr a
	adc.b $14
	tay
	rtl
CODE_8089C7:
	txa
	ldx.b $3C
CODE_8089CA:
	sta.b $14
	cmp.w #$1001
	bcc CODE_8089D4
	lda.w #$1000
CODE_8089D4:
	sta.w $0104,x
	pha
	tya
	sta.w $0106,x
	pla
	clc
	adc.w $0106,x
	tay
	lda.b $0C
	sta.w $0101,x
	clc
	adc.w #$1000
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FA
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	lda.b $14
	sec
	sbc.w #$1000
	beq CODE_808A0E
	bcs CODE_8089CA
CODE_808A0E:
	stx.b $3C
	rtl
CODE_808A11:
	sta.b $16
	lda.w $0761
	bmi CODE_808A1B
CODE_808A18:
	jmp.w CODE_808A11
CODE_808A1B:
	cpx.w #$0020
	bcc CODE_808A2F
CODE_808A20:
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
CODE_808A2F:
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
	adc.w $079C
	ora.b $1C
	tax
CODE_808A5E:
	stx.w VMADDL
	phx
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808AA1
	ldx.b $18
	ldy.w #$0000
CODE_808A71:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808A71
CODE_808A80:
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
	bne CODE_808A9C
CODE_808A96:
	txa
	clc
	adc.w $079E
	tax
CODE_808A9C:
	dec.b $1A
	bne CODE_808A5E
	rtl
CODE_808AA1:
	lda.w #$0020
	sbc.b $1C
	sta.b $20
	tax
	ldy.w #$0000
CODE_808AAC:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808AAC
	lda.b $01,s
	clc
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	lda.b $18
	sec
	sbc.b $20
	tax
CODE_808ACD:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808ACD
	jmp.w CODE_808A80
CODE_808ADF:
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
	bmi CODE_808B0C
	jmp.w CODE_808B96
CODE_808B0C:
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
CODE_808B1F:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808B5F
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
CODE_808B35:
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
	bne CODE_808B5A
	tya
	clc
	adc.w $079E
	tay
CODE_808B5A:
	dec.b $1A
	bne CODE_808B1F
	rtl
CODE_808B5F:
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
	jmp.w CODE_808B35
CODE_808B96:
	stx.b $0C
CODE_808B98:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808BC6
	lda.b $18
	asl a
	tax
	phy
	jsl.l CODE_808950
	ply
CODE_808BAC:
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne CODE_808BC1
	tya
	clc
	adc.w $079E
	tay
CODE_808BC1:
	dec.b $1A
	bne CODE_808B98
	rtl
CODE_808BC6:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	phy
	jsl.l CODE_808950
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
	jsl.l CODE_808950
	ply
	jmp.w CODE_808BAC
CODE_808BED:
	cpx.w #$0020
	bcc CODE_808C01
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
CODE_808C01:
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
	bmi CODE_808C1C
	jmp.w CODE_808CBF
CODE_808C1C:
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
CODE_808C4A:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808C88
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
CODE_808C60:
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
	bne CODE_808C83
	tya
	clc
	adc.w $079E
	tay
CODE_808C83:
	dec.b $1A
	bne CODE_808C4A
	rtl
CODE_808C88:
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
	jmp.w CODE_808C60
CODE_808CBF:
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
CODE_808CDB:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808D16
	lda.b $18
	asl a
	tax
	phy
	lda.b $0C
	pha
	jsl.l CODE_808950
	pla
	sta.b $0C
	ply
CODE_808CF5:
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
	bne CODE_808D11
	tya
	clc
	adc.w $079E
	tay
CODE_808D11:
	dec.b $1A
	bne CODE_808CDB
	rtl
CODE_808D16:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	lda.b $0C
	pha
	phy
	jsl.l CODE_808950
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
	jsl.l CODE_808950
	ply
	pla
	sta.b $0C
	jmp.w CODE_808CF5
CODE_808D43:
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
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	lda.w $0761
	bmi CODE_808D72
	jmp.w CODE_808DB3
CODE_808D72:
	sep #$20
	lda.b $0E
	sta.w A1B1
	stz.w DMAP1
	stz.w VMAIN
	lda.b #$18
	sta.w BBAD1
	rep #$20
CODE_808D86:
	lda.b $18
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $18
	tax
	tya
	clc
	adc.w #$0080
	tay
	dec.b $1A
	bne CODE_808D86
	sep #$20
	lda.b #$80
	sta.w VMAIN
	rep #$20
	rtl
CODE_808DB3:
	stx.b $0C
	ldx.b $3C
CODE_808DB7:
	lda.b $0C
	sta.w $0101,x
	clc
	adc.b $18
	sta.b $0C
	lda.b $18
	sta.w $0104,x
	tya
	sta.w $0106,x
	clc
	adc.w #$0080
	tay
	sep #$20
	lda.b $0E
	sta.w $0103,x
	lda.b #$FB
	sta.w $0100,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	dec.b $1A
	bne CODE_808DB7
	stx.b $3C
	rtl
CODE_808DED:
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
	ldx.b $22
	ldy.w #$0000
CODE_808E08:
	lda.b [$0C]
	and.w #$00FF
	beq CODE_808E1C
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dex
	bne CODE_808E08
CODE_808E1B:
	rtl
CODE_808E1C:
	dex
	bmi CODE_808E1B
	lda.w #$0020
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	bra CODE_808E1C
CODE_808E2D:
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
CODE_808E58:
	ldx.b $18
	ldy.w #$0000
CODE_808E5D:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808E5D
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne CODE_808E58
	rtl
CODE_808E7C:
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
	sta.b $1C
	tax
	lda.b $22
	asl a
	jsl.l Mul16U
	lda.b $20
	asl a
	clc
	adc.b $08
	adc.w #$0006
	adc.b $0C
	sta.b $0C
CODE_808EAE:
	ldx.b $18
	ldy.w #$0000
CODE_808EB3:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808EB3
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $1C
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne CODE_808EAE
	rtl
CODE_808ED2:
	php
	sep #$20
	dey
CODE_808ED6:
	sta.b [$10],y
	dey
	bne CODE_808ED6
	sta.b [$10]
	plp
	rtl
CODE_808EDF:
	txy
	dey
	dey
CODE_808EE2:
	sta.b [$10],y
	dey
	dey
	bne CODE_808EE2
	sta.b [$10]
	rtl
CODE_808EEB:
	sta.b $14
	txy
	dey
	dey
CODE_808EF0:
	lda.b [$10],y
	clc
	adc.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808EF0
	lda.b [$10]
	clc
	adc.b $14
	sta.b [$10]
	rtl
CODE_808F03:
	sta.b $14
	txy
	dey
	dey
CODE_808F08:
	lda.b [$10],y
	ora.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808F08
	lda.b [$10]
	ora.b $14
	sta.b [$10]
	rtl
CODE_808F19:
	sta.b $14
	txy
	dey
	dey
CODE_808F1E:
	lda.b [$10],y
	and.b $14
	sta.b [$10],y
	dey
	dey
	bne CODE_808F1E
	lda.b [$10]
	and.b $14
	sta.b [$10]
	rtl
CODE_808F2F:
	txa
	txy
	lsr a
	bcc CODE_808F3D
	dey
	sep #$20
	lda.b [$0C],y
	sta.b [$10],y
	rep #$20
CODE_808F3D:
	dey
	dey
CODE_808F3F:
	lda.b [$0C],y
	sta.b [$10],y
	dey
	dey
	bne CODE_808F3F
	lda.b [$0C]
	sta.b [$10]
	rtl
CODE_808F4C:
	phy
CODE_808F4D:
	sep #$30
	sta.w WRMPYA
	stx.w WRMPYB
	rep #$30
CODE_808F57:
	nop
	lda.w RDMPYL
	ply
	rtl
CODE_808F5D:
	phy
CODE_808F5E:
	cpx.w #$0000
	bpl CODE_808F4D
CODE_808F63:
	sep #$30
	sta.w WRMPYA
	txa
	eor.b #$FF
	inc a
	sta.w WRMPYB
	rep #$30
	lda.w #$0000
	sec
	sbc.w RDMPYL
	ply
	rtl
CODE_808F7A:
	tyx
	bra CODE_808F63
CODE_808F7D:
	phy
	tay
	bpl CODE_808F5E
	txa
	bpl CODE_808F7A
	eor.w #$FFFF
	inc a
	sta.w WRMPYA
	tya
	eor.w #$FFFF
	inc a
	sta.w WRMPYB
	bra CODE_808F57
CODE_808F95:
	phy
	bra CODE_808F9F
CODE_808F98:
	phy
	tay
	beq CODE_808FC3
	txa
	beq CODE_808FC3
CODE_808F9F:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $0A
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $08
	sty.w WRMPYB
	stz.b $0B
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	ply
	rtl
CODE_808FC3:
	stz.b $08
	stz.b $0A
	ply
	rtl
CODE_808FC9:
	phy
	tay
	beq CODE_808FC3
CODE_808FCD:
	txa
	beq CODE_808FC3
	bpl CODE_808F9F
	eor.w #$FFFF
	inc a
CODE_808FD6:
	jsl.l CODE_808F95
CODE_808FDA:
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
	ply
	rtl
CODE_808FEB:
	phy
	tay
	beq CODE_808FC3
	bpl CODE_808FCD
	eor.w #$FFFF
	inc a
	tay
	txa
	beq CODE_808FC3
	bpl CODE_808FD6
	eor.w #$FFFF
	inc a
	jmp.w CODE_808F9F
