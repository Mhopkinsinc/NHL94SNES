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
	jsl.l CODE_9C9786
	jsl.l forceblack
.loop:
	lda.w MusicOn
	bne .loop
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
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
	lda.w #$009A
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
	lda.w #$009A
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
	lda.w #$009A
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
	sta.l $7E35B6
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l DMAToVRAM
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE027
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$35F4
	sta.b $10
	jsl.l Decompress
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
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
	adc.l $7E35B6
	sta.l $7E35AE
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b a0
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D7
	sta.b a1
	jsl.l RemapTiles
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
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
	sta.l $7E35CE
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
	lda.l DATA8_9C850F+2,x
	sta.b $0E
	lda.l DATA8_9C850F,x
	sta.b $0C
	ldy.w #$0008
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	lda.l DATA8_9D93AD,x
	and.w #$00FF
	tay
	pla
	sta.b [$10],y
	lda.b $01,s
	asl a
	asl a
	asl a
	tax
	jsr.w CODE_9D93E3
	ldy.w #$0012
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	inx
	lda.l DATA8_9D93AD,x
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
	jsr.w CODE_9D93E3
	plx
	dex
	bpl .loopx
	lda.l $7E35CE
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
	lda.w #$009A
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
	lda.w #$0096
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
	lda.w #$009A
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
	lda.w #DATA8_9D94FE
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF415
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
	sta.w $1D59
	lda.w #$9C53
	sta.w $1D5A
	lda.w #$009D
	sta.w $1D5C
	jsl.l CODE_9D9A5C
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
	adc.l $7E35CE
	sta.l $7EA676,x
	ora.w #$4000
	sta.l $7EA686,x
	inx
	inx
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l $7E35CE
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
	adc.l $7E35CE
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
	adc.l $7E35CE
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41A
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
	lda.w #$0000
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
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$6E82
	sta.w printm
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
	lda.w $0AB8
	ora.w $0ABA
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
	jsl.l CODE_9D96A9
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w JoyPad
	ora.w $0778
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
