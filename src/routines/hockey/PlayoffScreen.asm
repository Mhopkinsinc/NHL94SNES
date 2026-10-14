; The playoff tree screen
PlayoffScreen:
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0000
	sta.l $7E35AA
	sta.l $7E35AC
	lda.l $7E34BC
	bne .t3
	jmp.w .3

.t3:
	cmp.w #$0004
	bne .t1
	jmp.w .3

.t1:
	lda.l playoffRoundIdx
	cmp.w #$0002
	bcc .t2
	lda.w $07ED
	cmp.w #$ED31
	beq .t2
	jsl.l FadeOutSound
	jsl.l forceblack
.loop:
	lda.w MusicOn
	bne .loop
	lda.w #PlayoffSong>>16
	sta.b $0E
	lda.w #PlayoffSong
	sta.b $0C
	jsl.l MusicStart
	jmp.w .2

.t2:
	jsl.l forceblack
.2:
	sep #$20
	lda.b #$09
	sta.w BGMODE
	lda.b #$01
	sta.w BG1SC
	lda.b #$08
	sta.w BG2SC
	lda.b #$39
	sta.w BG3SC
	lda.b #$31
	sta.w BG12NBA
	lda.b #$04
	sta.w BG34NBA
	lda.b #$03
	sta.w OBSEL
	lda.b #$07
	sta.w TM
	rep #$30
	lda.w #DATA8_95F1AE>>16
	sta.b $0E
	lda.w #DATA8_95F1AE
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
	ldy.w #$3000
	jsl.l DMAToVRAM
	lda.w #DATA8_9ABA95>>16
	sta.b $0E
	lda.w #DATA8_9ABA95
	sta.b $0C
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0246
	sta.b $0C
	phx
	ldx.w #$0240
	ldy.w #$0800
	jsl.l DMAToVRAM
	pla
	sec
	sbc.w #$0240
	tax
	ldy.w #$0920
	jsl.l DMAToVRAM
	lda.w #DATA8_9AE121>>16
	sta.b $0E
	lda.w #DATA8_9AE121
	sta.b $0C
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w #DATA8_9AE8BF>>16
	sta.b $0E
	lda.w #DATA8_9AE8BF
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.l smallfontchars
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l DMAToVRAM
	lda.w #DATA8_9AE027>>16
	sta.b $0E
	lda.w #DATA8_9AE027
	sta.b $0C
	lda.w #palbuffer>>16
	sta.b $12
	lda.w #palbuffer
	sta.b $10
	jsl.l Decompress
	lda.w #SmallFontTiles>>16
	sta.b $0E
	lda.w #SmallFontTiles
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	adc.l smallfontchars
	sta.l $7E35AE
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b a0
	lda.w #PixelRemap8F>>16
	sta.b $8F
	lda.w #PixelRemap8F
	sta.b a1
	jsl.l RemapTiles
	lda.w #SmallFontTiles>>16
	sta.b $0E
	lda.w #SmallFontTiles
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35AE
	sta.l scorechars
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l DMAToVRAM
	lda.w #$031A
	sta.l $7E3676
	sta.l $7E3696
	sta.l $7E36B6
	sta.l $7E36D6
	lda.w #$007E
	sta.b $12
	lda.w #$3674
	sta.b $10
	ldx.w #$001B
.loopx:
	phx
	txa
	asl a
	asl a
	tax
	lda.l TeamBlockPalettes+2,x
	sta.b $0E
	lda.l TeamBlockPalettes,x
	sta.b $0C
	ldy.w #$0008
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	lda.l .8,x
	and.w #$00FF
	tay
	pla
	sta.b [$10],y
	lda.b $01,s
	asl a
	asl a
	asl a
	tax
	jsr.w .9
	ldy.w #$0012
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	inx
	lda.l .8,x
	and.w #$00FF
	tay
	pla
	sta.b [$10],y
	lda.b $01,s
	asl a
	inc a
	asl a
	asl a
	tax
	jsr.w .9
	plx
	dex
	bpl .loopx
	lda.l scorechars
	clc
	adc.w #$0070
	sta.l $7E35C6
	lda.w #$007F
	sta.b $0E
	lda.w #$6700
	sta.b $0C
	ldx.w #$0E00
	ldy.w #$FFFF
	jsl.l DMAToVRAM
	lda.w #DATA8_9AE884>>16
	sta.b $0E
	lda.w #DATA8_9AE884
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
	lda.w #$3654
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #DATA8_968C02>>16
	sta.b $0E
	lda.w #DATA8_968C02
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
	ldy.w #$FFFF
	jsl.l DMAToVRAM
	lda.w #DATA8_9AB610>>16
	sta.b $0E
	lda.w #DATA8_9AB610
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	jsl.l Decompress
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	lda.w #$0000
	ldx.w #$8000
	jsl.l MemFill
	lda.w #$007E
	sta.b $12
	lda.w #$A676
	sta.b $10
	lda.w #$0000
	ldx.w #$4002
	jsl.l MemFill
	lda.w #$007E
	sta.b $8F
	lda.w #$34D2
	sta.b a1
	lda.w #$009D
	sta.b $8B
	lda.w #.10
	sta.b a0
	lda.l playoffRoundIdx
	asl a
	tay
	lda.b [a0],y
	adc.b a0
	sta.b a0
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PlayoffScreenPos>>16
	sta.b $8F
	lda.w #PlayoffScreenPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	sta.l $7E3466
.loop2:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printx
	lda.w #$3000
	sta.w $0D0D
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printy
	lda.b [a1]
	inc.b a1
	and.w #$00FF
	sta.b $CD
	tay
	lda.l $7E34F2
	tax
	tya
	eor.l $7E34D2,x
	and.w #$00FF
	bne .1
	lda.w #$3400
	sta.w $0D0D
.1:
	lda.b $CD
	asl a
	tax
	lda.l TeamPlaceNames,x
	sta.b $0C
	lda.w #$009C
	sta.b $0E
	lda.w printx
	pha
	lda.w #$005C
	sta.w jmlvector
	lda.w #BigLetterPlayoff
	sta.w jmlvector+1
	lda.w #BigLetterPlayoff>>16
	sta.w jmlvector+3
	jsl.l RenderBigText
	pla
	sta.w printx
	lda.b $CD
	asl a
	asl a
	asl a
	clc
	adc.w #$7500
	sta.b a2
	lda.w #$0000
	adc.w #$007F
	sta.b $93
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
	lda.w #$0007
	sta.b tmp0
	sta.b tmp1
	lda.b [a2]
	clc
	adc.l scorechars
	sta.l $7EA676,x
	ora.w #$4000
	sta.l $7EA686,x
	inx
	inx
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l scorechars
.loop3:
	sta.l $7EA676,x
	inx
	inx
	dec.b tmp0
	bne .loop3
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l scorechars
	ora.w #$8000
	sta.l $7EA766,x
	ora.w #$C000
	sta.l $7EA776,x
	inx
	inx
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l scorechars
	ora.w #$8000
.loop4:
	sta.l $7EA766,x
	inx
	inx
	dec.b tmp1
	bne .loop4
org $9D9000
	dec.b d4
	beq .t1x
	jmp.w .loop2

.t1x:
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
	jsl.l DMAToVRAM
.loopxx:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	cmp.w #$00FF
	beq .7
	asl a
	adc.w #$B72C
	sta.b tmp0
	lda.w #$0099
	sta.b tmp1
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	tax
	lda.l DATA8_99B726+2
	tay
.loop2x:
	lda.b [tmp0]
	sta.l $7EA876,x
	lda.b tmp0
	clc
	adc.l DATA8_99B726
	adc.l DATA8_99B726
	sta.b tmp0
	txa
	adc.w #$0100
	tax
	dey
	bne .loop2x
	bra .loopxx
.3:
	stz.w textdirtyhi
	lda.w #$FFFF
	sta.w textdirtylo
	rtl
.7:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $AF
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $A7
	stz.b $B3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PlayoffScreenPos2>>16
	sta.b $8F
	lda.w #PlayoffScreenPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $0ACF
	cmp.w #$0007
	beq .1x
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d4
	beq .1x
	stz.b a2
.loopxxx:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printx
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	sta.w printy
	lda.w #mesarea>>16
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0005
	sta.w mesarea
	ldx.b a2
	lda.l $7E3548,x
	adc.w #$0030
	sta.w mesarea+2
	lda.w #$002D
	sta.w $0A2D
	lda.l $7E3558,x
	adc.w #$0030
	sta.w $0A2E
	lda.w #$6E82
	sta.w printm
	jsl.l print
	inc.b a2
	inc.b a2
	dec.b d4
	bne .loopxxx
.1x:
	lda.w #DATA8_95FF9B>>16
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
	jsl.l PasteMap
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #N8hTxt>>16
	sta.b $8F
	lda.w #N8hTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$6E82
	sta.w printm
	jsl.l PWprint
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
	jsl.l MapPartToVRAM
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
	jsl.l MapPartToVRAM
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
	jsl.l DMAToCGRAM
	jsl.l ScreenOn
.2x:
	jsl.l WaitFrame
	jsl.l ReadPads
	lda.w padnew
	ora.w padnew+2
	cmp.w #$1000
	bne .t2x
	jmp.w .3

.t2x:
	lda.b $83
	cmp.b d7
	beq .2x
	sta.b d7
	ldx.w #$3622
	ldy.w #$007E
	jsl.l PulseColour
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w JoyPad
	ora.w JoyPad+2
	bit.w #$0200
	bne .t1xx
	bit.w #$0100
	bne .t3x
	lda.b $B3
	bne .3x
	jmp.w .2x

.t1xx:
	lda.w #$FFFE
	sta.b $B3
	jmp.w .3x

.t3x:
	lda.w #$0002
	sta.b $B3
.3x:
	lda.w Hscroll
	clc
	adc.b $B3
	cmp.b $AF
	bcs .t2xx
	jmp.w .5

.t2xx:
	cmp.b $A7
	bcc .t1xxx
	jmp.w .5

.t1xxx:
	sta.w Hscroll
	and.w #$0007
	beq .t3xx
	jmp.w .4

.t3xx:
	lda.b $B3
	bmi .t2xxx
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$002F
	cmp.w #$0080
	bcc .t1xxxx
	jmp.w .4

.t1xxxx:
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
	jsl.l MapPartToVRAM
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
	jsl.l MapPartToVRAM
	bra .4

.t2xxx:
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	sec
	sbc.w #$0010
	bcc .4
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
	jsl.l MapPartToVRAM
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
	jsl.l MapPartToVRAM
.4:
	lda.w Hscroll
	cmp.w #$0058
	beq .5
	cmp.w #$00B0
	beq .5
	cmp.w #$0108
	beq .5
	cmp.w #$0180
	beq .5
	cmp.w #$01F8
	beq .5
	cmp.w #$0250
	beq .5
	cmp.w #$02A8
	bne .6
.5:
	stz.b $B3
.6:
	lda.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	jmp.w .2x
.8:
	db $04,$06,$08,$0A,$0C,$0E,$10,$12,$14,$16,$18,$1A,$1C,$1E,$24,$26
	db $28,$2A,$2C,$2E,$30,$32,$34,$36,$38,$3A,$3C,$3E,$44,$46,$48,$4A
	db $4C,$4E,$50,$52,$54,$56,$58,$5A,$5C,$5E,$64,$66,$68,$6A,$6C,$6E
	db $70,$72,$74,$76,$78,$7A
.9:
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
	bcc .1xx
	ora.b #$01
.1xx:
	sta.l $7F7501,x
	sta.l $7F7503,x
	lda.b $01,s
	tax
	tya
	lsr a
	and.b #$0F
	sta.b $00
	jsr.w .t1xxxxx
	rep #$20
	pla
	clc
	adc.w #$0020
	tax
	sep #$20
	jsr.w .7x
	rep #$20
	rts

.t1xxxxx:
	lda.b #$01
	pha
	ldy.w #$0007
.2xx:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1xxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .3xx

.t1xxxxxx:
	lda.b #$80
	sta.l $7F6700,x
.3xx:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1xxxxxxx
	lda.b #$7F
	sta.l $7F6700,x
	bra .4x

.t1xxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.4x:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1xxxxxxxx
	lda.b #$7F
	sta.l $7F6700,x
	bra .5x

.t1xxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.5x:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1xxxxxxxxx
	lda.b #$7F
	sta.l $7F6700,x
	bra .6x

.t1xxxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.6x:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl .2xx
	pla
	rts
.7x:
	lda.b #$01
	pha
	ldy.w #$0007
.1xxx:
	phx
	lda.b $03,s
	and.b #$01
	beq .t1xxxxxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .2xxx

.t1xxxxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.2xxx:
	inx
	lda.b $03,s
	and.b #$02
	beq .t1xxxxxxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .3xxx

.t1xxxxxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.3xxx:
	txa
	clc
	adc.b #$0F
	tax
	lda.b $03,s
	and.b #$04
	beq .t1xxxxxxxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .4xx

.t1xxxxxxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.4xx:
	inx
	lda.b $03,s
	and.b #$08
	beq .t1xxxxxxxxxxxxx
	lda.b #$FF
	sta.l $7F6700,x
	bra .5xx

.t1xxxxxxxxxxxxx:
	lda.b #$00
	sta.l $7F6700,x
.5xx:
	lda.b $00
	sta.b $03,s
	plx
	inx
	inx
	dey
	bpl .1xxx
	pla
	rts
.10:
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
