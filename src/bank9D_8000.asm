; Bank $9D, first 4 KB: screen code, with auto labels for now. It starts with the box drawer that lays the 3 x 3 box maps
; of bank $9C (corners, edges, middle) into the BG map buffer at $7E37F4, then menu and roster screen code; DATA8_9D875A
; holds the position names (Team, Center, Left Wing ... Goalie). CODE_9D8B49 sets up two indirect HDMA channels: one
; sets the windows with DATA8_9D8BA9 and the values DATA8_9D8BA1, one sets COLDATA with DATA8_9D8BB5 and DATA8_9D8BB3.

org $9D8000
CODE_9D8000:
	phx
	phy
	lda.l $7E35BC
	clc
	adc.l $7E35A8
	ora.w printa
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$8086
	sta.b $0C
	jsr.w $804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D8028
	sta.w $0CD5
CODE_9D8028:
	dec.b $A9
	dec.b $A9
CODE_9D802C:
	lda.w #$808C
	sta.b $0C
	jsr.w $804F
	dec.b $A9
	bne CODE_9D802C
	lda.w #$8092
	sta.b $0C
	jsr.w $804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D804C
	sta.w $0CD7
CODE_9D804C:
	ply
	plx
	rtl
CODE_9D804F:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	sta.b $C9
	tax
	lda.b [$0C]
	clc
	adc.b $C5
	sta.l $7E37F4,x
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b $C5
	ldy.b $A5
	dey
	dey
CODE_9D8077:
	inx
	inx
	sta.l $7E37F4,x
	dey
	bne CODE_9D8077
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	clc
	adc.b $C5
	sta.l $7E37F6,x
	inc.w printy
	rts
CODE_9D8091:
	phx
	phy
	lda.l $7E35BE
	clc
	adc.l $7E35A8
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$81DE
	sta.b $0C
	jsr.w $804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D80B6
	sta.w $0CD5
CODE_9D80B6:
	dec.b $A9
	dec.b $A9
CODE_9D80BA:
	lda.w #$81E4
	sta.b $0C
	jsr.w $804F
	dec.b $A9
	bne CODE_9D80BA
	lda.w #$81EA
	sta.b $0C
	jsr.w $804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D80DA
	sta.w $0CD7
CODE_9D80DA:
	ply
	plx
	rtl
CODE_9D80DD:
	phx
	phy
	lda.l $7E35C0
	clc
	adc.l $7E35A8
	sta.b $C5
	lda.w #$009C
	sta.b $0E
	lda.w #$8316
	sta.b $0C
	jsr.w $804F
	lda.b $C9
	lsr a
	cmp.w $0CD5
	bcs CODE_9D8102
	sta.w $0CD5
CODE_9D8102:
	dec.b $A9
	dec.b $A9
CODE_9D8106:
	lda.w #$831C
	sta.b $0C
	jsr.w $804F
	dec.b $A9
	bne CODE_9D8106
	lda.w #$8322
	sta.b $0C
	jsr.w $804F
	inx
	inx
	txa
	lsr a
	cmp.w $0CD7
	bcc CODE_9D8126
	sta.w $0CD7
CODE_9D8126:
	ply
	plx
	rtl
CODE_9D8129:
	lda.w #$0001
	sta.l $7E3474
	stz.w $1E3F
	jsl.l ClearTeamStats
	jsl.l CODE_9D87D7
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
	lda.w #$0008
	ldx.w #$003E
	jsl.l CODE_9DCCF5
	stz.w $1DB9
	stz.w $1E3D
	jsl.l CODE_9D8292
	jsl.l CODE_9D842F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF390
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$000B
	sta.b $A9
	jsl.l CODE_9D80DD
	jsl.l CODE_9D8489
	jsl.l CODE_9D8B49
	jsl.l CODE_8086BD
CODE_9D8195:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	ldx.w #$0002
	lda.w $0AB8
	sta.b $14
CODE_9D81A9:
	lda.w $1C84,x
	beq CODE_9D81B5
	lda.w $0AB8,x
	ora.b $14
	sta.b $14
CODE_9D81B5:
	inx
	inx
	cpx.w #$000A
	bcc CODE_9D81A9
	lda.b $14
	bit.w #$1000
	bne CODE_9D821A
	bit.w #$0800
	beq CODE_9D81CC
	jsl.l CODE_9B866C
CODE_9D81CC:
	bit.w #$4000
	bne CODE_9D8222
	bit.w #$8080
	bne CODE_9D8240
	bit.w #$0040
	beq CODE_9D81DE
	jmp.w $825E
CODE_9D81DE:
	lda.w $1E3F
	bne CODE_9D81EF
	lda.w $1E3D
	inc a
	cmp.w #$012C
	bcs CODE_9D8246
	sta.w $1E3D
CODE_9D81EF:
	stz.w $1D5E
	lda.w $0776
	ora.w $0778
	bit.w #$0400
	beq CODE_9D8203
	lda.w #$FFFF
	sta.w $1D5E
CODE_9D8203:
	jsl.l CODE_9EC95C
	lda.w $1E3F
	bne CODE_9D8217
	lda.l $7E34CC
	bne CODE_9D8217
	dec.w $0D41
	bmi CODE_9D821A
CODE_9D8217:
	jmp.w $8195
CODE_9D821A:
	lda.w #$0000
	sta.l $7E3474
	rtl
CODE_9D8222:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl CODE_9D8234
	lda.w #$0006
	sta.w $1DB9
CODE_9D8234:
	sta.w $1DB9
	jsl.l CODE_9D8489
	stz.w $1E3D
	bra CODE_9D8217
CODE_9D8240:
	lda.w #$FFFF
	sta.w $1E3F
CODE_9D8246:
	lda.w $1DB9
	inc a
	cmp.w #$0007
	bcc CODE_9D8252
	lda.w #$0000
CODE_9D8252:
	sta.w $1DB9
	jsl.l CODE_9D8489
	stz.w $1E3D
	bra CODE_9D8217
CODE_9D825E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF395
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0014
	sta.b $A5
	lda.w #$0009
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsl.l CODE_9D842F
	bra CODE_9D8217
CODE_9D8292:
	lda.w #$FFFF
	sta.w $1E49
	sta.w $1E4B
	sta.w $1E4D
	sta.w $1E4F
	sta.w $1E51
	sta.w $1E53
	sta.w $1E55
	sta.w $1E57
	sta.w $1E59
	sta.w $1E5B
	sta.w $1E5D
	sta.w $1E5F
	lda.w #$FF06
	sta.w $1E61
	sta.w $1E65
	sta.w $1E69
	sta.w $1E63
	sta.w $1E67
	sta.w $1E6B
	lda.w #$00FA
	sta.w $1E6D
	sta.w $1E71
	sta.w $1E75
	sta.w $1E6F
	sta.w $1E73
	sta.w $1E77
	stz.w $1E45
	stz.w $1E47
	stz.b $91
	jsl.l CODE_9D8330
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9D8330
	lda.w HomeTeam
	sta.w $1E41
	lda.w #$0001
	sta.w $1E43
	lda.w $1E45
	sec
	sbc.w $1E47
	bmi CODE_9D830F
	bra CODE_9D831C
CODE_9D830F:
	lda.w VisTeam
	sta.w $1E41
	lda.w $1E47
	sec
	sbc.w $1E45
CODE_9D831C:
	cmp.w #$0008
	bcs CODE_9D832F
	stz.w $1E43
	cmp.w #$0004
	bcs CODE_9D832F
	lda.w #$FFFF
	sta.w $1E41
CODE_9D832F:
	rtl
CODE_9D8330:
	jsl.l GetPlayerCount
	lda.b $A5
	sta.b $B5
	ldx.w #$0000
CODE_9D833B:
	stx.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC5FC
	lda.b $A5
	sta.b $AD
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	sec
	sbc.b $AD
	sta.b $A5
	ldy.b $91
	lda.w $1E45,y
	clc
	adc.b $A5
	sta.w $1E45,y
	stx.b $B1
	jsl.l CODE_9D8372
	inx
	cpx.b $B5
	bmi CODE_9D833B
	rtl
CODE_9D8372:
	lda.b $B1
	sta.b $A9
	lda.b $A5
	sta.b $08
	cmp.w $1E61,y
	beq CODE_9D8381
	bpl CODE_9D8391
CODE_9D8381:
	cmp.w $1E65,y
	beq CODE_9D8388
	bpl CODE_9D83AD
CODE_9D8388:
	cmp.w $1E69,y
	beq CODE_9D83D3
	bpl CODE_9D83C9
	bra CODE_9D83D3
CODE_9D8391:
	lda.w $1E61,y
	sta.b $00
	lda.w $1E49,y
	sta.b $04
	lda.b $A5
	sta.w $1E61,y
	lda.b $A9
	sta.w $1E49,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D83AD:
	lda.w $1E65,y
	sta.b $00
	lda.w $1E4D,y
	sta.b $04
	lda.b $A5
	sta.w $1E65,y
	lda.b $A9
	sta.w $1E4D,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D83C9:
	lda.b $A5
	sta.w $1E69,y
	lda.b $A9
	sta.w $1E51,y
CODE_9D83D3:
	lda.b $B1
	sta.b $A9
	lda.b $08
	sta.b $A5
	cmp.w $1E6D,y
	bmi CODE_9D83EC
	cmp.w $1E71,y
	bmi CODE_9D8408
	cmp.w $1E75,y
	bmi CODE_9D8424
	bra CODE_9D842E
CODE_9D83EC:
	lda.w $1E6D,y
	sta.b $00
	lda.w $1E55,y
	sta.b $04
	lda.b $A5
	sta.w $1E6D,y
	lda.b $A9
	sta.w $1E55,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D8408:
	lda.w $1E71,y
	sta.b $00
	lda.w $1E59,y
	sta.b $04
	lda.b $A5
	sta.w $1E71,y
	lda.b $A9
	sta.w $1E59,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D8424:
	lda.b $A5
	sta.w $1E75,y
	lda.b $A9
	sta.w $1E5D,y
CODE_9D842E:
	rtl
CODE_9D842F:
	jsl.l InitScoutDisplay
	lda.w #$001D
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$001C
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w $1E41
	bmi CODE_9D8453
	lda.w #$001E
	sta.b [$89]
	inc.b $89
	inc.b $89
CODE_9D8453:
	lda.w HomeTeam
	sta.b $A5
	lda.w #$001F
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w VisTeam
	cmp.b $A5
	beq CODE_9D8471
	lda.w #$0020
	sta.b [$89]
	inc.b $89
	inc.b $89
CODE_9D8471:
	lda.w #$0021
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$FFFF
	sta.b [$89]
	stz.w $1D5E
	lda.w #$7FFF
	sta.w $0D41
	rtl
CODE_9D8489:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF39A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000B
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsl.l SpriteFrameStart
	ldx.w #$0056
	ldy.w #$0010
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF39F
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3A9
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w VisTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3AE
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.w $1DB9
	bne CODE_9D851D
	jmp.w $8631
CODE_9D851D:
	dec.w $1DB9
	lda.w #$FFFF
	sta.l $7E3454
	sta.l $7E3452
	stz.b $91
	lda.w $1DB9
	sta.l $7E345A
	lda.w #$0002
	sta.b $91
	lda.w $1DB9
	sta.l $7E345C
	jsl.l CODE_9DDDB3
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b $A5
	sta.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	stz.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3BD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b $A5
	sta.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0021
	sec
	sbc.b [$8D]
	sta.w printx
	jsl.l CODE_9EC7BE
	inc.w $1DB9
	jmp.w $86AA
CODE_9D8631:
	lda.w HomeTeam
	sta.l $7E3452
	lda.w VisTeam
	sta.l $7E3454
	jsl.l CODE_9DDDB3
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C7
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	stz.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3D6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
CODE_9D86AA:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3E5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	sta.b $A5
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9D875A
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3EA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $A5
	pla
	cmp.b $A5
	beq CODE_9D8737
	bmi CODE_9D871B
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3F8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9D8751
CODE_9D871B:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF402
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9D8751
CODE_9D8737:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF40C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9D8751:
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
incsrc "data/text/DATA8_9D875A.asm"
CODE_9D87B5:
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	ldy.w #$0008
	lda.b [$89],y
	clc
	adc.b $89
	clc
	adc.w #$0004
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	rtl
CODE_9D87D7:
	jsl.l CODE_9F96F7
	lda.w #$0081
	sta.b $0E
	lda.w #TeamLogoSprites
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	jsl.l Decompress
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	sep #$20
	lda.b #$00
	sta.w BG1SC
	lda.b #$04
	sta.w BG2SC
	lda.b #$12
	sta.w BG12NBA
	lda.b #$03
	sta.w OBSEL
	lda.b #$13
	sta.w TM
	rep #$30
	lda.w #$FF00
	sta.l $7E35AA
	sta.l $7E35A8
	lda.w #$0000
	sta.l $7E35AC
	lda.l $7E35D0
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	sta.w VMADDL
	lda.l $7E35D0
	inc a
	sta.l $7E35B6
	sta.l $7E35C0
	lda.w #$0000
	ldy.w #$FFFF
	ldx.w #$0020
	jsl.l CODE_8087EA
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
	sta.b $A5
	clc
	adc.l $7E35C0
	sta.l $7E35C0
	lda.b $A5
	clc
	adc.l $7E35B6
	sta.l $7E35BC
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D7
	sta.b $8D
	jsl.l RemapTiles
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C8000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3E7
	sta.b $8D
	lda.w #$0004
	sta.b $A5
	clc
	adc.l $7E35C0
	sta.l $7E35C0
	lda.b $A5
	clc
	adc.l $7E35BC
	sta.l $7E35CE
	jsl.l RemapTiles
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC1F3
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
	clc
	adc.l $7E35C0
	sta.l $7E35C0
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.l $7E35CE
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C81F0
	sta.b $0C
	ldx.w #$0120
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$0095
	sta.b $0E
	lda.w #DATA8_95F1AE
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
	sta.l $7E35B4
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ABA95
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
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0000
	ldy.w #$0000
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l CODE_808E2D
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADE57
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
	ldy.w #$0000
	ldx.w #$0030
	jsl.l CODE_9DE0BD
	lda.w #$0094
	sta.b $0E
	lda.w #DATA8_94D6A5
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
	jsl.l CODE_80891F
	lda.w HomeTeam
	cmp.w #$0018
	bcs CODE_9D89FE
	stz.b $91
CODE_9D89FE:
	lda.w VisTeam
	cmp.w #$0018
	bcs CODE_9D8A0B
	lda.w #$0002
	sta.b $91
CODE_9D8A0B:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC0CC
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	sec
	sbc.w #$0008
	tay
	lda.b $10
	clc
	adc.w #$0006
	sta.b $10
CODE_9D8A31:
	lda.b [$10],y
	beq CODE_9D8A48
	clc
	adc.l $7E35B4
	clc
	adc.l $7E35AC
	clc
	adc.w #$0800
	tyx
	sta.l $7E3FF4,x
CODE_9D8A48:
	dey
	dey
	bpl CODE_9D8A31
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADE57
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
	ldy.w #$0000
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.b $0C
	clc
	adc.w #$0020
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE946
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
	ldy.w #$0020
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	sep #$20
	stz.w CGADD
	stz.w CGDATA
	stz.w CGDATA
	rep #$20
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE121
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
	ldy.w #$0030
	ldx.w #$0020
	jsl.l CODE_9DE0BD
	lda.l $7E35C0
	clc
	adc.w #$1000
	sta.l $7E35C0
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AD3B6
	sta.b $0C
	ldy.w #$0080
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AF15C
	sta.b $0C
	ldy.w #$00C0
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	jsl.l CODE_9DE0D4
	jsl.l CODE_9DD977
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	ldx.w #$0000
	ldy.w #$0180
	lda.w #$6000
	jsl.l InitSprites
	jsl.l SpriteFrameStart
	jsl.l CODE_9DDF73
	rtl
CODE_9D8B49:
	sep #$20
	lda.b #$A0
	sta.w WOBJSEL
	lda.b #$0C
	sta.w WH0
	lda.b #$B3
	sta.w WH1
	lda.b #$10
	sta.w CGWSEL
	lda.b #$02
	sta.w CGADSUB
	lda.b #$E5
	sta.w COLDATA
	lda.b #$44
	sta.w DMAP2
	lda.b #$9D
	sta.w A1B2
	sta.w DASB2
	ldx.w #DATA8_9D8BA9
	stx.w A1T2L
	lda.b #$26
	sta.w BBAD2
	lda.b #$40
	sta.w DMAP3
	lda.b #$9D
	sta.w A1B3
	sta.w DASB3
	ldx.w #DATA8_9D8BB5
	stx.w A1T3L
	lda.b #$32
	sta.w BBAD3
	lda.b #$0C
	sta.w HDMAEN
	rep #$20
	rtl
DATA8_9D8BA1:		; WH0-WH3 values (window 1 left, right, window 2 left, right) for DATA8_9D8BA9
	db $FF,$00,$FF,$00
	db $0C,$B3,$FF,$00
DATA8_9D8BA9:		; indirect HDMA table: line count, then the address of the values in this bank; $00 ends it
	db $68 : dw DATA8_9D8BA1
	db $58 : dw DATA8_9D8BA1+4
	db $14 : dw DATA8_9D8BA1
	db $00
DATA8_9D8BB3:		; COLDATA values for DATA8_9D8BB5
	db $E7,$E0
DATA8_9D8BB5:		; indirect HDMA table, as DATA8_9D8BA9
	db $6E : dw DATA8_9D8BB3+1
	db $4C : dw DATA8_9D8BB3
	db $14 : dw DATA8_9D8BB3+1
	db $00
CODE_9D8BBF:
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0000
	sta.l $7E35AA
	sta.l $7E35AC
	lda.l $7E34BC
	bne CODE_9D8BDE
	jmp.w $9064
CODE_9D8BDE:
	cmp.w #$0004
	bne CODE_9D8BE6
	jmp.w $9064
CODE_9D8BE6:
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9D8C15
	lda.w $07ED
	cmp.w #$ED31
	beq CODE_9D8C15
	jsl.l CODE_9C9786
	jsl.l CODE_8086A9
CODE_9D8BFF:
	lda.w $07F3
	bne CODE_9D8BFF
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w $8C19
CODE_9D8C15:
	jsl.l CODE_8086A9
CODE_9D8C19:
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
	lda.w #$0095
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
	jsl.l CODE_80891F
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
	jsl.l CODE_80891F
	pla
	sec
	sbc.w #$0240
	tax
	ldy.w #$0920
	jsl.l CODE_80891F
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
	jsl.l CODE_808723
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
	jsl.l CODE_80891F
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
	sta.b $A5
	adc.l $7E35B6
	sta.l $7E35AE
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D7
	sta.b $8D
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
	jsl.l CODE_80891F
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
CODE_9D8DA2:
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
	jsr.w $93E3
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
	jsr.w $93E3
	plx
	dex
	bpl CODE_9D8DA2
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
	jsl.l CODE_80891F
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
	jsl.l CODE_808F2F
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
	jsl.l CODE_80891F
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
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $12
	lda.w #$A676
	sta.b $10
	lda.w #$0000
	ldx.w #$4002
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $8F
	lda.w #$34D2
	sta.b $8D
	lda.w #$009D
	sta.b $8B
	lda.w #DATA8_9D94FE
	sta.b $89
	lda.l $7E35D4
	asl a
	tay
	lda.b [$89],y
	adc.b $89
	sta.b $89
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.b $B5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF415
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0001
	sta.l $7E3466
CODE_9D8F15:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.w printx
	lda.w #$3000
	sta.w printa
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.w printy
	lda.b [$8D]
	inc.b $8D
	and.w #$00FF
	sta.b $CD
	tay
	lda.l $7E34F2
	tax
	tya
	eor.l $7E34D2,x
	and.w #$00FF
	bne CODE_9D8F4E
	lda.w #$3400
	sta.w printa
CODE_9D8F4E:
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
	sta.b $91
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
	sta.b $C5
	sta.b $C7
	lda.b [$91]
	clc
	adc.l $7E35CE
	sta.l $7EA676,x
	ora.w #$4000
	sta.l $7EA686,x
	inx
	inx
	inc.b $91
	inc.b $91
	lda.b [$91]
	clc
	adc.l $7E35CE
CODE_9D8FC3:
	sta.l $7EA676,x
	inx
	inx
	dec.b $C5
	bne CODE_9D8FC3
	inc.b $91
	inc.b $91
	lda.b [$91]
	clc
	adc.l $7E35CE
	ora.w #$8000
	sta.l $7EA766,x
	ora.w #$C000
	sta.l $7EA776,x
	inx
	inx
	inc.b $91
	inc.b $91
	lda.b [$91]
	clc
	adc.l $7E35CE
	ora.w #$8000
CODE_9D8FF6:
	sta.l $7EA766,x
	inx
	inx
	dec.b $C7
	bne CODE_9D8FF6
