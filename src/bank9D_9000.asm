; Bank $9D, second 4 KB: screen code, with auto labels for now: the Team Roster screen (Player and Rating columns,
; Y - Switch Teams) and the code around it. Its tables (DATA8_9D93AD, DATA8_9D94FE, DATA8_9D977D, DATA8_9D9A28,
; DATA8_9D9B7B, DATA8_9D9CC2) are read here and in bank9D_8000 but not identified yet.

org $9D9000
	dec.b $B5
	beq CODE_9D9007
	jmp.w $8F15
CODE_9D9007:
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	ldy.w #$4000
	lda.l $7E3466
	inc a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l CODE_80891F
CODE_9D9022:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9D906E
	asl a
	adc.w #$B72C
	sta.b $C5
	lda.w #$0099
	sta.b $C7
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	asl a
	tax
	lda.l DATA8_99B726+2
	tay
CODE_9D9047:
	lda.b [$C5]
	sta.l $7EA876,x
	lda.b $C5
	clc
	adc.l DATA8_99B726
	adc.l DATA8_99B726
	sta.b $C5
	txa
	adc.w #$0100
	tax
	dey
	bne CODE_9D9047
	bra CODE_9D9022
CODE_9D9064:
	stz.w $0CD7
	lda.w #$FFFF
	sta.w $0CD5
	rtl
CODE_9D906E:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $AF
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $A7
	stz.b $B3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9D910B
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.b $B5
	beq CODE_9D910B
	stz.b $91
CODE_9D90B7:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.w printx
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	asl a
	asl a
	sta.w printy
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0005
	sta.w $0A2A
	ldx.b $91
	lda.l $7E3548,x
	adc.w #$0030
	sta.w $0A2C
	lda.w #$002D
	sta.w $0A2D
	lda.l $7E3558,x
	adc.w #$0030
	sta.w $0A2E
	lda.w #$6E82
	sta.w $0CD9
	jsl.l CODE_9EC7BE
	inc.b $91
	inc.b $91
	dec.b $B5
	bne CODE_9D90B7
CODE_9D910B:
	lda.w #$0095
	sta.b $0E
	lda.w #DATA8_95FF9B
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$A676
	sta.b $10
	lda.w #$0080
	sta.b $24
	ldx.w #$003D
	ldy.w #$0008
	lda.l $7E35C6
	ora.w #$0C00
	jsl.l CODE_808E2D
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$6E82
	sta.w $0CD9
	jsl.l CODE_9BC6C9
	lda.w #$0080
	sta.l $7EA670
	sta.l $7EC676
	lda.w #$0020
	sta.l $7EA672
	sta.l $7EC678
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	lda.w #$0020
	sta.b $24
	stz.b $26
	lda.w #$0040
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	lda.w #$0020
	sta.b $24
	stz.b $26
	lda.w #$0040
	sta.b $18
	lda.w #$001C
	sta.b $1A
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$0180
	sta.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	lda.w #$FFFC
	sta.w $07E0
	lda.w #$1D47
	sta.l $7E3616
	sta.l $7E361E
	lda.w #$FFFF
	sta.l $7E361A
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0070
	jsl.l CODE_808723
	jsl.l CODE_8086BD
CODE_9D9221:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	lda.w $0AB8
	ora.w $0ABA
	cmp.w #$1000
	bne CODE_9D9237
	jmp.w $9064
CODE_9D9237:
	lda.b $83
	cmp.b $C1
	beq CODE_9D9221
	sta.b $C1
	ldx.w #$3622
	ldy.w #$007E
	jsl.l CODE_9D96A9
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w $0776
	ora.w $0778
	bit.w #$0200
	bne CODE_9D9274
	bit.w #$0100
	bne CODE_9D927C
	lda.b $B3
	bne CODE_9D9281
	jmp.w $9221
CODE_9D9274:
	lda.w #$FFFE
	sta.b $B3
	jmp.w $9281
CODE_9D927C:
	lda.w #$0002
	sta.b $B3
CODE_9D9281:
	lda.w Hscroll
	clc
	adc.b $B3
	cmp.b $AF
	bcs CODE_9D928E
	jmp.w $9394
CODE_9D928E:
	cmp.b $A7
	bcc CODE_9D9295
	jmp.w $9394
CODE_9D9295:
	sta.w Hscroll
	and.w #$0007
	beq CODE_9D92A0
	jmp.w $936E
CODE_9D92A0:
	lda.b $B3
	bmi CODE_9D930D
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$002F
	cmp.w #$0080
	bcc CODE_9D92B6
	jmp.w $936E
CODE_9D92B6:
	sta.b $24
	pha
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.b $24
	sec
	sbc.w #$0020
	and.w #$003F
	tax
	phx
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	plx
	pla
	sta.b $24
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldy.w #$0000
	jsl.l CODE_808BED
	bra CODE_9D936E
CODE_9D930D:
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	sec
	sbc.w #$0010
	bcc CODE_9D936E
	sta.b $24
	pha
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.b $24
	sec
	sbc.w #$0020
	and.w #$003F
	tax
	phx
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	plx
	pla
	sta.b $24
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldy.w #$0000
	jsl.l CODE_808BED
CODE_9D936E:
	lda.w Hscroll
	cmp.w #$0058
	beq CODE_9D9394
	cmp.w #$00B0
	beq CODE_9D9394
	cmp.w #$0108
	beq CODE_9D9394
	cmp.w #$0180
	beq CODE_9D9394
	cmp.w #$01F8
	beq CODE_9D9394
	cmp.w #$0250
	beq CODE_9D9394
	cmp.w #$02A8
	bne CODE_9D9396
CODE_9D9394:
	stz.b $B3
CODE_9D9396:
	lda.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	jmp.w $9221
DATA8_9D93AD:
	db $04,$06,$08,$0A,$0C,$0E,$10,$12,$14,$16,$18,$1A,$1C,$1E,$24,$26
	db $28,$2A,$2C,$2E,$30,$32,$34,$36,$38,$3A,$3C,$3E,$44,$46,$48,$4A
	db $4C,$4E,$50,$52,$54,$56,$58,$5A,$5C,$5E,$64,$66,$68,$6A,$6C,$6E
	db $70,$72,$74,$76,$78,$7A
CODE_9D93E3:
	txa
	asl a
	asl a
	asl a
	asl a
	pha
	sep #$20
	txa
	lsr a
	sta.l $7F7500,x
	inc a
	sta.l $7F7502,x
	tya
	lsr a
	lsr a
	lsr a
	and.b #$1C
	clc
	adc.b #$30
	cpx.w #$0200
	bcc CODE_9D9406
	ora.b #$01
CODE_9D9406:
	sta.l $7F7501,x
	sta.l $7F7503,x
	lda.b $01,s
	tax
	tya
	lsr a
	and.b #$0F
	sta.b $00
	jsr.w $942A
	rep #$20
	pla
	clc
	adc.w #$0020
	tax
	sep #$20
	jsr.w $9494
	rep #$20
	rts
CODE_9D942A:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D9430:
	phx
	lda.b $03,s
	and.b #$01
	beq CODE_9D943F
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D9445
CODE_9D943F:
	lda.b #$80
	sta.l $7F6700,x
CODE_9D9445:
	inx
	lda.b $03,s
	and.b #$02
	beq CODE_9D9454
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D945A
CODE_9D9454:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D945A:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq CODE_9D946D
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9473
CODE_9D946D:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9473:
	inx
	lda.b $03,s
	and.b #$08
	beq CODE_9D9482
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D9488
CODE_9D9482:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D9488:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D9430
	pla
	rts
CODE_9D9494:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D949A:
	phx
	lda.b $03,s
	and.b #$01
	beq CODE_9D94A9
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94AF
CODE_9D94A9:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94AF:
	inx
	lda.b $03,s
	and.b #$02
	beq CODE_9D94BE
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94C4
CODE_9D94BE:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94C4:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq CODE_9D94D7
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94DD
CODE_9D94D7:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94DD:
	inx
	lda.b $03,s
	and.b #$08
	beq CODE_9D94EC
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94F2
CODE_9D94EC:
	lda.b #$00
	sta.l $7F6700,x
CODE_9D94F2:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl CODE_9D949A
	pla
	rts
DATA8_9D94FE:
	db $0A,$00,$47,$00,$94,$00,$ED,$00,$4C,$01,$10,$31,$02,$31,$05,$31
	db $08,$31,$0B,$31,$0E,$31,$11,$31,$14,$31,$17,$46,$02,$46,$05,$46
	db $08,$46,$0B,$46,$0E,$46,$11,$46,$14,$46,$17,$00,$3A,$01,$3B,$0A
	db $44,$0B,$45,$FF,$30,$30,$08,$34,$04,$34,$0A,$34,$10,$34,$16,$49
	db $04,$49,$0A,$49,$10,$49,$16,$18,$26,$02,$26,$05,$26,$08,$26,$0B
	db $26,$0E,$26,$11,$26,$14,$26,$17,$51,$02,$51,$05,$51,$08,$51,$0B
	db $51,$0E,$51,$11,$51,$14,$51,$17,$31,$04,$31,$0A,$31,$0F,$31,$15
	db $46,$04,$46,$0A,$46,$0F,$46,$15,$00,$2F,$01,$30,$02,$3A,$03,$3B
	db $08,$44,$09,$45,$0A,$4F,$0B,$50,$FF,$21,$3F,$04,$34,$08,$34,$12
	db $49,$08,$49,$12,$1C,$1B,$02,$1B,$05,$1B,$08,$1B,$0B,$1B,$0E,$1B
	db $11,$1B,$14,$1B,$17,$5C,$02,$5C,$05,$5C,$08,$5C,$0B,$5C,$0E,$5C
	db $11,$5C,$14,$5C,$17,$26,$04,$26,$0A,$26,$0F,$26,$15,$51,$04,$51
	db $0A,$51,$0F,$51,$15,$31,$07,$31,$12,$46,$07,$46,$12,$00,$24,$01
	db $25,$02,$2F,$03,$30,$04,$3A,$05,$3B,$06,$44,$07,$45,$08,$4F,$09
	db $50,$0A,$5A,$0B,$5B,$FF,$16,$4A,$02,$34,$0D,$49,$0D,$1E,$10,$02
	db $10,$05,$10,$08,$10,$0B,$10,$0E,$10,$11,$10,$14,$10,$17,$67,$02
	db $67,$05,$67,$08,$67,$0B,$67,$0E,$67,$11,$67,$14,$67,$17,$1B,$04
	db $1B,$0A,$1B,$0F,$1B,$15,$5C,$04,$5C,$0A,$5C,$0F,$5C,$15,$26,$07
	db $26,$12,$51,$07,$51,$12,$31,$0C,$46,$0C,$00,$19,$01,$1A,$02,$24
	db $03,$25,$04,$2F,$05,$30,$05,$3A,$06,$45,$06,$4F,$07,$50,$08,$5A
	db $09,$5B,$0A,$65,$0B,$66,$FF,$0B,$55,$01,$3E,$17,$1F,$10,$02,$10
	db $05,$10,$08,$10,$0B,$10,$0E,$10,$11,$10,$14,$10,$17,$67,$02,$67
	db $05,$67,$08,$67,$0B,$67,$0E,$67,$11,$67,$14,$67,$17,$1B,$04,$1B
	db $0A,$1B,$0F,$1B,$15,$5C,$04,$5C,$0A,$5C,$0F,$5C,$15,$26,$07,$26
	db $12,$51,$07,$51,$12,$31,$0C,$46,$0C,$3B,$17,$00,$19,$01,$1A,$02
	db $24,$03,$25,$04,$2F,$05,$30,$05,$3A,$06,$45,$06,$4F,$07,$50,$08
	db $5A,$09,$5B,$0A,$65,$0B,$66,$FF,$0B,$55,$00
CODE_9D96A9:
	phx
	phy
	lda.b $83
	sta.b $08
	lda.w #$001E
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	sta.b $C5
	lda.b $00
	sta.b $08
	lda.w #$0002
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	asl a
	tax
	lda.l DATA8_9D977D,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	xba
	and.w #$00FF
	lsr a
	lsr a
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	xba
	and.w #$FF00
	asl a
	asl a
	sta.b $C9
	lda.l DATA8_9D977D,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.b $C9
	lda.l DATA8_9D977D,x
	and.w #$001F
	sta.b $C7
	lda.l DATA8_9D977D+2,x
	and.w #$001F
	sec
	sbc.b $C7
	phx
	ldx.b $C5
	jsl.l Mul16S
	lda.w #$001E
	sta.b $04
	jsl.l Div32S
	plx
	lda.b $00
	clc
	adc.b $C7
	and.w #$001F
	ora.b $C9
	ply
	plx
	stx.b $10
	sty.b $12
	sta.b [$10]
	rtl
DATA8_9D977D:
	dw $7FFF,$7E10,$7FFF
CODE_9D9783:
	stx.b $87
	ldx.w #$0000
CODE_9D9788:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9D9788
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9D9799:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9D9799
	ldx.b $87
	lda.l $7E34D0
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b $89
	lda.w #$ED59
	clc
	adc.b $A9
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	ldy.w #$000E
	sty.b $AD
CODE_9D97CB:
	lda.b [$8D],y
	sta.b [$89],y
	dey
	dey
	bpl CODE_9D97CB
	lda.w #$34E2
	sta.b $8D
	lda.b $8B
	sta.b $8F
	lda.w $0AD5
	sta.b $A5
CODE_9D97E1:
	lda.b $A5
	and.w #$0001
	sta.b $A9
	tay
	sep #$20
	lda.b [$89],y
	sta.b [$8D]
	rep #$20
	inc.b $8D
	inc.b $89
	inc.b $89
	lsr.b $A5
	dec.b $AD
	bpl CODE_9D97E1
	jsl.l GetShifter
	lda.b $A9
	bmi CODE_9D9840
	lda.b $AD
	asl a
	adc.w #$34D2
	sta.b $89
	lda.w #$007E
	sta.b $8B
	stz.b $8D
CODE_9D9814:
	ldx.b $8D
	lda.w #$0000
	sta.l $7E3578,x
	sta.l $7E3588,x
	sta.l $7E3568,x
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9D985F
	inc.b $8D
	inc.b $8D
	dec.b $A9
	bpl CODE_9D9814
	jsl.l CODE_9D995D
CODE_9D9840:
	stx.b $87
	ldx.w #$000E
CODE_9D9845:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9D9845
	ldx.b $87
	stx.b $87
	ldx.w #$0012
CODE_9D9853:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9D9853
	ldx.b $87
	ldx.b $95
	rtl
CODE_9D985F:
	lda.w $0ACF
	cmp.w #$0002
	beq CODE_9D9893
	cmp.w #$0003
	beq CODE_9D9893
	cmp.w #$0005
	beq CODE_9D9893
	lda.l $7E3598,x
	ora.w #$0001
	sta.l $7E3598,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3538,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3528,x
	rtl
CODE_9D9893:
	lda.l $7E3598,x
	and.w #$FFFE
	sta.l $7E3598,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3528,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3538,x
	rtl
GetShifter:
	lda.w #$FFF0
	sta.b $AD
	lda.w #$0010
	sta.b $A9
	lda.l $7E35D4
	tay
CODE_9D98C4:
	lda.b $AD
	clc
	adc.b $A9
	sta.b $AD
	lsr.b $A9
	dey
	bpl CODE_9D98C4
	dec.b $A9
	rtl
CODE_9D98D3:
	jsl.l RandomWord
	and.w #$001F
	sta.b $A5
CODE_9D98DC:
	lda.b $A5
	inc a
	and.w #$001F
	sta.b $A5
	asl a
	asl a
	asl a
	asl a
	adc.w #$ED59
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.w #$000F
	sta.b $A9
	lda.l $7E34BE
	sta.b $AD
	cmp.w #$001A
	bcc CODE_9D9907
	lda.w #$0019
	sta.b $AD
CODE_9D9907:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.b $AD
	beq CODE_9D9918
	dec.b $A9
	bpl CODE_9D9907
	bra CODE_9D98DC
CODE_9D9918:
	lda.b $A9
	eor.w #$000F
	sta.b $A9
	sta.l $7E34F2
	lda.b $A5
	sta.l $7E34D0
	lda.w #$0000
	sta.l $7E35D4
	lda.w #$0007
	sta.w $0ACF
	lda.l $7E34BC
	cmp.w #$0002
	beq CODE_9D9959
	stz.w $0ACF
	lda.w #$0007
	sta.b $A5
	ldx.w #$0000
	txa
CODE_9D994B:
	sta.l $7E3548,x
	sta.l $7E3558,x
	inx
	inx
	dec.b $A5
	bpl CODE_9D994B
CODE_9D9959:
	jml.l CODE_9D9783
CODE_9D995D:
	lda.l $7E34CC
	bne CODE_9D9966
	jmp.w $9A23
CODE_9D9966:
	lda.l $7E34BC
	bne CODE_9D996F
	jmp.w $9A0E
CODE_9D996F:
	cmp.w #$0004
	bne CODE_9D9977
	jmp.w $9A0E
CODE_9D9977:
	jsl.l GetShifter
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b $89
	lda.l $7E34F2
	tay
	lda.b [$89],y
	and.w #$00FF
	sta.b $AD
	lda.b $A9
	asl a
	sta.b $8D
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b $A5
CODE_9D999F:
	lda.b $AD
	ldx.b $8D
	cmp.l $7E3528,x
	beq CODE_9D99C7
	cmp.l $7E3538,x
	beq CODE_9D99B8
	dec.b $8D
	dec.b $8D
	dec.b $A9
	bpl CODE_9D999F
	rtl
CODE_9D99B8:
	lda.w #$0004
	sta.b $A5
	lda.l $7E3528,x
	sta.l $7E34C0
	bra CODE_9D99D1
CODE_9D99C7:
	stz.b $A5
	lda.l $7E3538,x
	sta.l $7E34C0
CODE_9D99D1:
	lda.b $A5
	clc
	adc.l $7E34CE
	sta.b $A5
	lda.b $A9
	sta.l $7E35D6
	lda.l $7E3528,x
	sta.w HomeTeam
	lda.l $7E3538,x
	sta.w VisTeam
	asl.b $A5
	asl.b $A5
	phb
	phk
	plb
	ldy.b $A5
	ldx.w #$0000
CODE_9D99FA:
	lda.w $1C84,x
	beq CODE_9D9A05
	lda.w DATA8_9D9A28,y
	sta.w $1C84,x
CODE_9D9A05:
	inx
	inx
	cpx.w #$000A
	bcc CODE_9D99FA
	plb
	rtl
CODE_9D9A0E:
	lda.l $7E34CA
	asl a
	asl a
	sta.b $A5
	tay
	lda.w #$009D
	sta.b $8B
	lda.w #$9A48
	sta.b $89
	iny
	iny
CODE_9D9A23:
	jsl.l CODE_9FC79F
	rtl
DATA8_9D9A28:
	dw $0001,$0000,$0001,$0001,$0001,$0002,$0002,$0001,$0002,$0000,$0002,$0002,$0002
	dw $0001,$0001,$0002,$0000,$0000,$0001,$0000,$0002,$0000,$0001,$0001,$0001,$0002
CODE_9D9A5C:
	phb
	phk
	plb
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	jsr.w $9B9B
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0024
	sta.b $14
	lsr a
	lsr a
	lsr a
	sta.b $16
	clc
	adc.w printx
	sta.w printx
	lda.b $16
	asl a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $14
	sta.b $14
	ldy.w #$0000
CODE_9D9A94:
	lda.b $14
	asl a
	sta.b $02
	lda.b [$0C],y
	and.w #$00FF
	bne CODE_9D9AA8
	lda.w #$FFFF
	sta.b $08
	jmp.w $9B0F
CODE_9D9AA8:
	cmp.w #$0020
	beq CODE_9D9ABE
	cmp.w #$002E
	bne CODE_9D9AB7
	lda.w #$001A
	bra CODE_9D9ABE
CODE_9D9AB7:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9D9ABE:
	phy
	sta.b $08
	cmp.w #$0020
	bne CODE_9D9ACB
	lda.w #$0005
	bra CODE_9D9B07
CODE_9D9ACB:
	lda.b $08
	asl a
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	sta.b $06
	lda.l $7E3466
	jsr.w $9BFC
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w $9BFC
	ldx.b $08
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9B07:
	clc
	adc.b $14
	cmp.w #$0008
	bcc CODE_9D9B59
CODE_9D9B0F:
	jsl.l $001D59
	inc.w printx
	lda.b $06
	sta.b $04
	lda.l $7E3466
	inc a
	inc a
	sta.l $7E3466
	lda.b $08
	bmi CODE_9D9B79
	cmp.w #$0020
	beq CODE_9D9B59
	lda.b $14
	eor.w #$0007
	sta.b $16
	asl a
	sta.b $0A
	lda.l $7E3466
	jsr.w $9C2A
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w $9C2A
CODE_9D9B59:
	ldx.b $08
	cmp.w #$0020
	bne CODE_9D9B65
	lda.w #$0005
	bra CODE_9D9B6C
CODE_9D9B65:
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9B6C:
	clc
	adc.b $14
	and.w #$0007
	sta.b $14
	ply
	iny
	jmp.w $9A94
CODE_9D9B79:
	plb
	rtl
DATA8_9D9B7B:
	db $FE,$FE,$FC,$FC,$F8,$F8,$F0,$F0,$E0,$E0,$C0,$C0,$80,$80,$00,$00
	db $FF,$FF,$7F,$7F,$3F,$3F,$1F,$1F,$0F,$0F,$07,$07,$03,$03,$01,$01
CODE_9D9B9B:
	stz.b $14
	ldy.w #$0000
CODE_9D9BA0:
	lda.b [$0C],y
	and.w #$00FF
	beq CODE_9D9BF9
	cmp.w #$0020
	bne CODE_9D9BB6
	cpy.w #$0000
	beq CODE_9D9BF6
	lda.w #$0005
	bra CODE_9D9BF1
CODE_9D9BB6:
	cmp.w #$002E
	bne CODE_9D9BC0
	lda.w #$0003
	bra CODE_9D9BF1
CODE_9D9BC0:
	cmp.w #$0040
	bne CODE_9D9BCE
	lda.l $9C963E
	and.w #$00FF
	bra CODE_9D9BF1
CODE_9D9BCE:
	cmp.w #$0030
	bcc CODE_9D9BE2
	cmp.w #$003A
	bcs CODE_9D9BE2
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9D9BE9
CODE_9D9BE2:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9D9BE9:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9BF1:
	clc
	adc.b $14
	sta.b $14
CODE_9D9BF6:
	iny
	bra CODE_9D9BA0
CODE_9D9BF9:
	lda.b $14
	rts
CODE_9D9BFC:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
CODE_9D9C06:
	ldy.b $04
	lda.b [$10],y
	ldy.b $14
	beq CODE_9D9C12
CODE_9D9C0E:
	lsr a
	dey
	bne CODE_9D9C0E
CODE_9D9C12:
	ldy.b $02
	and.w $9B8B,y
	ora.l $7E4EF4,x
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne CODE_9D9C06
	rts
CODE_9D9C2A:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
CODE_9D9C34:
	ldy.b $04
	lda.b [$10],y
	ldy.b $16
	iny
CODE_9D9C3B:
	asl a
	dey
	bne CODE_9D9C3B
	ldy.b $0A
	and.w DATA8_9D9B7B,y
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne CODE_9D9C34
	rts
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w printa
	sta.l $7EC67C,x
	inc a
	sta.l $7EC77C,x
	rtl
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w #$0400
	sta.l $7EA67C,x
	inc a
	sta.l $7EA6BC,x
	rtl
CODE_9D9C97:
	lda.w #$FFFF
	sta.l $7E34CC
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b $89
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9D9CC2
	sta.b $8D
	ldy.w #$0000
	ldx.w #$0007
CODE_9D9CB8:
	lda.b [$8D],y
	sta.b [$89],y
	iny
	iny
	dex
	bpl CODE_9D9CB8
	rtl
DATA8_9D9CC2:
	dw $0000,$000B,$000A,$0001,$0000,$0000,$0000,$0001
WeightedRandomSelect:
	lda.b $AB
	pha
	lda.b $A9
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$0000
	sta.b $8F
	lda.w #$0CF9
	sta.b $8D
	stz.b $A9
	bra CODE_9D9CF7
CODE_9D9CEC:
	lda.b $A9
	clc
	adc.b [$8D]
	sta.b $A9
	inc.b $8D
	inc.b $8D
CODE_9D9CF7:
	dec.b $A5
	bpl CODE_9D9CEC
	lda.b $A9
	sta.b $A5
	jsl.l randomd0
CODE_9D9D03:
	dec.b $8D
	dec.b $8D
	lda.b $A5
	sec
	sbc.b [$8D]
	sta.b $A5
	bpl CODE_9D9D03
	lda.b $8D
	sec
	sbc.w #$0CF9
	lsr a
	sta.b $A5
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $A9
	pla
	sta.b $AB
	rtl
CODE_9D9D26:
	jsl.l CODE_9DE0E9
	ldy.b $91
	lda.w tmline,y
	inc a
	sta.b $A5
	sta.w $0D43
	stz.w $0D47
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF424
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9F96E6
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0800
	jsl.l CODE_808EDF
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF431
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w printa
	lda.w #$000F
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF448
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w printa
	lda.w #$000F
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
CODE_9D9DE2:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF44D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	lda.b $91
	beq CODE_9D9E0D
	lda.w VisTeam
	sta.b $A9
	lda.w #$0030
CODE_9D9E0D:
	sta.b $A5
	jsl.l CODE_9FBE08
	jsl.l SpriteFrameEnd
	lda.w #$7F97
	sta.l $7F7502
	lda.w #$FFFF
	sta.l $7F7542
	jsl.l CODE_9DE0D4
	jsl.l CODE_9D9ECB
CODE_9D9E2D:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	beq CODE_9D9E4B
	jmp.w $A04C
CODE_9D9E4B:
	bit.w #$4000
	bne CODE_9D9E9C
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9D9E89
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9D9E89
	bit.w #$0800
	bne CODE_9D9E70
	inc.b $A5
	inc.b $A5
	bit.w #$0400
	beq CODE_9D9E86
CODE_9D9E70:
	lda.b $A5
	clc
	adc.w $0D43
	sta.b $A5
	bmi CODE_9D9E86
	cmp.w #$0008
	bcs CODE_9D9E86
	sta.w $0D43
	jsl.l CODE_9D9ECB
CODE_9D9E86:
	jmp.w $9E2D
CODE_9D9E89:
	lda.b $A5
	clc
	adc.w $0D47
	sta.b $A5
	bmi CODE_9D9E86
	sta.w $0D47
	jsl.l CODE_9D9ECB
	bra CODE_9D9E86
CODE_9D9E9C:
	lda.b $91
	eor.w #$0002
	sta.b $91
	jsl.l SpriteFrameStart
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF452
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jmp.w $9DE2
CODE_9D9ECB:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF45F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	sta.b $A5
	lda.w #$009D
	sta.b $8F
	lda.w #RosterLineNames
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.w #$0011
	sta.w printx
	lda.w #$0009
	sta.w printy
CODE_9D9F08:
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuSkater
	sta.b $8D
	lda.w $0D47
	sta.b $A5
	lda.w $0D43
	bne CODE_9D9F32
	lda.w #$0080
	sta.b $8F
	lda.w #AttribMenuGoalie
	sta.b $8D
	bra CODE_9D9F32
CODE_9D9F28:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_9D9F32:
	lda.b [$8D]
	bmi CODE_9D9F3A
	dec.b $A5
	bpl CODE_9D9F28
CODE_9D9F3A:
	lda.b [$8D]
	bpl CODE_9D9F43
	dec.w $0D47
	bra CODE_9D9F08
CODE_9D9F43:
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF464
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF469
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b $A5
	dec a
	sta.b $A9
	lda.w #$009D
	sta.b $9F
	lda.w #DATA8_9DA051
	sta.b $9D
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DA04D
	sta.b $95
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_9D9FFD
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$0006
	clc
	adc.b [$95],y
	sec
	adc.b $A5
	sta.b $95
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0004
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_9D9FFD
	bmi CODE_9D9FF9
	bvc CODE_9D9FFB
CODE_9D9FF7:
	bra CODE_9D9FFD
CODE_9D9FF9:
	bvc CODE_9D9FFD
CODE_9D9FFB:
	dec.b $A9
CODE_9D9FFD:
	lda.w #$0001
