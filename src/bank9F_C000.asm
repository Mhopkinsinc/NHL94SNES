; Bank $9F, fifth 4 KB: more game flow code, with auto labels for now; DATA8_9FCEEF is a small byte table.

org $9FC002
	sta.b $C9
	txa
	clc
	adc.w #$001D
	sec
	sbc.b $C7
	tax
CODE_9FC00D:
	txa
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $C5
	asl a
	adc.b $C5
	adc.w #$C800
	adc.w #$0006
	sta.b $C5
	lda.b $C9
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$0400
	sta.b $C9
	lda.b $C7
	sta.b $04
CODE_9FC030:
	lda.w #$007F
	sta.b $0E
	lda.b $C5
	sta.b $0C
	ldy.b $C9
	ldx.w #$0040
	jsl.l CODE_80891F
	lda.b $C5
	clc
	adc.w #$0040
	sta.b $0C
	lda.b $C9
	clc
	adc.w #$0400
	tay
	ldx.w #$0020
	jsl.l CODE_80891F
	lda.b $C5
	clc
	adc.w #$0060
	sta.b $C5
	lda.b $C9
	clc
	adc.w #$0020
	and.w #$03FF
	ora.w #$0400
	sta.b $C9
	dec.b $04
	bne CODE_9FC030
CODE_9FC072:
	lda.w Hscroll
	clc
	adc.w #$00C0
	sta.w $07DA
	lda.w Vscroll
	and.w #$0007
	sta.b $14
	lda.w $0D25
	asl a
	asl a
	asl a
	ora.b $14
	sta.w $07DC
	rtl
CODE_9FC090:
	lda.w $0D4D
	sta.b $AD
	lda.w $0D4B
	sta.b $B1
	lda.w sflags
	bit.w #$0040
	bne CODE_9FC102
	ldx.w #$001C
	lda.w $0AD9
	bmi CODE_9FC0DB
	tax
	lda.w pfgoal,x
	beq CODE_9FC0C6
	lda.w $0D4F
	adc.w $0CDD
	sta.w $0D4F
	cmp.w #$0032
	bmi CODE_9FC0DB
	lda.w #$0032
	sta.w $0D4F
	bra CODE_9FC0DB
CODE_9FC0C6:
	lda.w $0D4F
	sec
	sbc.w $0CDD
	sta.w $0D4F
	cmp.w #$FFCF
	bpl CODE_9FC0DB
	lda.w #$FFCE
	sta.w $0D4F
CODE_9FC0DB:
	lda.w $0EE3,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0100
	beq CODE_9FC0ED
	ora.w #$FE00
CODE_9FC0ED:
	clc
	adc.w Ypos,x
	clc
	adc.w $0D4F
	sta.b $AD
	sta.w $0D4D
	lda.w Xpos,x
	sta.b $B1
	sta.w $0D4B
CODE_9FC102:
	lda.b $AD
	sec
	sbc.w $0D37
	sta.b $A5
	cmp.w #$FFF7
	bpl CODE_9FC123
	lda.b $AD
	sec
	sbc.w #$FFF6
	sta.b $A9
	cmp.w #$FF39
	bpl CODE_9FC13C
	lda.w #$FF39
	sta.b $A9
	bra CODE_9FC13C
CODE_9FC123:
	lda.b $A5
	cmp.w #$000B
	bmi CODE_9FC15D
	lda.b $AD
	sec
	sbc.w #$000A
	sta.b $A9
	cmp.w #$0100
	bmi CODE_9FC13C
	lda.w #$0100
	sta.b $A9
CODE_9FC13C:
	lda.b $A9
	sec
	sbc.w $0D37
	beq CODE_9FC15D
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9FC150
	ora.w #$F000
CODE_9FC150:
	cmp.w #$0000
	bne CODE_9FC156
	inc a
CODE_9FC156:
	clc
	adc.w $0D37
	sta.w $0D37
CODE_9FC15D:
	lda.b $B1
	sec
	sbc.w $0CEB
	sta.b $A5
	cmp.w #$FFD8
	bpl CODE_9FC17E
	lda.b $B1
	sec
	sbc.w #$FFD8
	sta.b $A9
	cmp.w #$FFC4
	bpl CODE_9FC197
	lda.w #$FFC4
	sta.b $A9
	bra CODE_9FC197
CODE_9FC17E:
	lda.b $A5
	cmp.w #$0029
	bmi CODE_9FC1B8
	lda.b $B1
	sec
	sbc.w #$0028
	sta.b $A9
	cmp.w #$003D
	bmi CODE_9FC197
	lda.w #$003C
	sta.b $A9
CODE_9FC197:
	lda.b $A9
	sec
	sbc.w $0CEB
	beq CODE_9FC1B8
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9FC1AB
	ora.w #$F000
CODE_9FC1AB:
	cmp.w #$0000
	bne CODE_9FC1B1
	inc a
CODE_9FC1B1:
	clc
	adc.w $0CEB
	sta.w $0CEB
CODE_9FC1B8:
	rtl
CODE_9FC1B9:
	jsl.l CODE_9BC174
	dec.b $B5
	dec.b $B5
	lda.b $B1
	bit.w #$1000
	beq CODE_9FC1CE
	lda.b $B5
	jmp.w $936C
CODE_9FC1CD:
	rtl
CODE_9FC1CE:
	lda.w sfhormode
	beq CODE_9FC1E1
	lda.b $A5
	bit.w #$0008
	bne CODE_9FC1E1
	inc a
	inc a
	and.w #$0007
	sta.b $A5
CODE_9FC1E1:
	lda.w sflags
	bit.w #$0100
	beq CODE_9FC1EC
	jmp.w $C26F
CODE_9FC1EC:
	lda.w $0B7D,x
	cmp.w #$BCC7
	beq CODE_9FC1CD
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC200
	ldy.w #$0002
CODE_9FC200:
	lda.w $1D55,y
	ply
	cmp.w #$0000
	bmi CODE_9FC20D
	cmp.b $B5
	bne CODE_9FC222
CODE_9FC20D:
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC219
	ldy.w #$0002
CODE_9FC219:
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FC273
CODE_9FC222:
	lda.b $A9
	bit.w #$2000
	bne CODE_9FC299
	cpx.w $0AD9
	bne CODE_9FC231
	jmp.w $C2CE
CODE_9FC231:
	lda.b $A9
	bit.w #$4000
	bne CODE_9FC277
	lda.w $14E3,x
	bne CODE_9FC26C
	lda.b $A9
	bit.w #$0040
	bne CODE_9FC2BA
	bit.w #$8000
	bne CODE_9FC27B
	lda.w position,x
	beq CODE_9FC287
	lda.b $A9
	bit.w #$0020
	bne CODE_9FC27F
	bit.w #$0010
	bne CODE_9FC283
	lda.w $0D07
	cmp.b $E4
	beq CODE_9FC26C
	lda.b $A9
	bit.w #$0080
	bne CODE_9FC2B6
	jml.l CODE_9EA8A9
CODE_9FC26C:
	jmp.w $C331
CODE_9FC26F:
	jml.l CODE_9FB30F
CODE_9FC273:
	jml.l CODE_9FD733
CODE_9FC277:
	jml.l CODE_9EA24C
CODE_9FC27B:
	jml.l CODE_9FCBB6
CODE_9FC27F:
	jml.l CODE_9FCD4D
CODE_9FC283:
	jml.l CODE_9FCD2F
CODE_9FC287:
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9FC294
	and.w #$0002
	bne CODE_9FC298
CODE_9FC294:
	jml.l CODE_9EA8A9
CODE_9FC298:
	rtl
CODE_9FC299:
	lda.w $15D6
	bne CODE_9FC298
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FC2A9
	ldy.w #$0002
CODE_9FC2A9:
	lda.w $1D55,y
	bpl CODE_9FC298
	lda.b $B5
	sta.w $1D55,y
	jmp.w $D2FE
CODE_9FC2B6:
	jml.l CODE_9E81F9
CODE_9FC2BA:
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9FC2C5
	ldy.w #$0002
CODE_9FC2C5:
	lda.w $1C90,y
	beq CODE_9FC298
	jml.l CODE_9FCD2A
CODE_9FC2CE:
	lda.w $14E3,x
	bne CODE_9FC26C
	jsl.l CODE_9EC417
	lda.w position,x
	bne CODE_9FC2E1
	lda.w $1543,x
	bne CODE_9FC298
CODE_9FC2E1:
	lda.w sflags
	bit.w #$0004
	bne CODE_9FC311
	bit.w #$0008
	bne CODE_9FC315
	lda.w $0BA3
	cmp.b $E4
	beq CODE_9FC371
	lda.b $A9
	bit.w #$8000
	bne CODE_9FC322
	bit.w #$4000
	bne CODE_9FC319
	lda.w position,x
	beq CODE_9FC32E
	lda.b $A9
	bit.w #$0080
	bne CODE_9FC32A
	jml.l CODE_9EA8A9
CODE_9FC311:
	jml.l passmode
CODE_9FC315:
	jml.l ShotMode
CODE_9FC319:
	lda.w #$0014
	sta.b $A5
	jml.l assinsert
CODE_9FC322:
	jml.l CODE_9EE6D2
CODE_9FC326:
	jml.l CODE_9FCBB6
CODE_9FC32A:
	jml.l CODE_9EE17A
CODE_9FC32E:
	jmp.w $C287
CODE_9FC331:
	cpx.w $0AD9
	beq CODE_9FC371
	lda.b $A9
	bit.w #$8000
	bne CODE_9FC326
	bit.w #$0040
	beq CODE_9FC345
	jmp.w DATA16_80C2BA
CODE_9FC345:
	bit.w #$0080
	beq CODE_9FC371
	ldy.w $0D07
	bmi CODE_9FC371
	lda.w pflags,y
	and.w #$1000
	ora.w $14E3,y
	bne CODE_9FC371
	lda.w $19D4,y
	bpl CODE_9FC371
	lda.w pfteam,y
	cmp.w pfteam,x
	bne CODE_9FC371
	sty.b $A5
	inc.w $0BAB
	jsl.l CODE_9FCB68
	rtl
CODE_9FC371:
	rtl
CODE_9FC372:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $95
	pha
	lda.b $97
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w #$0A2A
	sta.b $95
	inc a
	inc a
	sta.b $8D
	lda.w #$0000
	sta.b $97
	sta.b $8F
	lda.w #$0004
	sta.b [$95]
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	jsl.l PutDigits2
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8D7
	sta.b $8D
	jsl.l appstring
	pla
	sta.b $8F
	pla
	sta.b $8D
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $97
	pla
	sta.b $95
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	rtl
CODE_9FC3F8:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	stz.b $91
	lda.w $1636
	sta.b $A5
	bpl CODE_9FC416
	and.w #$00FF
	sta.b $A5
	inc.b $91
	inc.b $91
CODE_9FC416:
	jsl.l CODE_9FC372
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9FC427:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.b [$89]
	sta.b $A5
	clc
	adc.b $89
	sta.b $91
	lda.b $8B
	sta.b $93
	inc.b $89
	inc.b $89
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.w #$002E
	sta.b [$8D]
	inc.b $8D
CODE_9FC470:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FC470
CODE_9FC47C:
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.b $89
	cmp.b $91
	bne CODE_9FC47C
	jsl.l CODE_9ECE06
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9FC4A1:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	stz.b $91
	lda.w $1636
	sta.b $A5
	bpl CODE_9FC4BF
	and.w #$00FF
	sta.b $A5
	inc.b $91
	inc.b $91
CODE_9FC4BF:
	jsl.l CODE_9FC4D0
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9FC4D0:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.b $A5
	jsl.l PutDigits2
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	lda.b [$89]
	sta.b $A5
	clc
	adc.b $89
	sta.b $91
	lda.b $8B
	sta.b $93
	inc.b $89
	inc.b $89
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.w #$002E
	sta.b [$8D]
	inc.b $8D
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
CODE_9FC545:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FC545
CODE_9FC551:
	lda.b [$89]
	inc.b $89
	sta.b [$8D]
	inc.b $8D
	lda.b $89
	cmp.b $91
	bne CODE_9FC551
	jsl.l CODE_9ECE06
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
GetPlayerNumInitial:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	stz.b $91
	lda.w $1636
	sta.b $A5
	bpl CODE_9FC595
	and.w #$00FF
	sta.b $A5
	lda.w #$0002
	sta.b $91
CODE_9FC595:
	jsl.l CODE_9FC427
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9FC5A6:
	jsl.l CODE_9ECDE1
	lda.w #$000B
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jml.l eraser
PutDigits2:
	lda.w #$2020
	sta.b $C5
	lda.b $A5
	and.w #$00FF
	cmp.w #$000A
	bcc CODE_9FC5D7
	lsr a
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$0030
	sta.b $C5
CODE_9FC5D7:
	lda.b $A5
	and.w #$000F
	clc
	adc.w #$0030
	sta.b $C6
	lda.b $C5
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	rtl
PushNumber:
	phx
	lda.w #$0000
	sta.b $8F
	lda.w #$0A48
	sta.b $8D
	lda.b $A5
CODE_9FC5F8:
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
	lda.b $00
	bne CODE_9FC5F8
	dec.b $8D
	dec.b $8D
	lda.w #$0A48
	sec
	sbc.b $8D
	sta.b [$8D]
	plx
	rtl
CODE_9FC623:
	lda.b $A5
	pha
	lda.b $A9
	cmp.w #$0002
	bne CODE_9FC63B
	lda.b $A5
CODE_9FC62F:
	cmp.w #$0064
	bcc CODE_9FC639
	sbc.w #$0064
	bra CODE_9FC62F
CODE_9FC639:
	sta.b $A5
CODE_9FC63B:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A8E
	sta.b $8D
	lda.b $A9
	inc a
	inc a
	sta.w $0A8E
	tay
	lda.w #$2020
	sta.w $0A90
	sta.w $0A92
	sta.w $0A94
	sta.w $0A96
	phx
	lda.b $A5
CODE_9FC65F:
	sta.b $08
	lda.w #$000A
	sta.b $04
	dey
	jsl.l Div16x8U
	lda.w RDMPYL
	sep #$20
	clc
	adc.b #$30
	sta.w $0A8E,y
	rep #$20
	lda.b $00
	bne CODE_9FC65F
	plx
	pla
	sta.b $A5
	lda.b $00
	rtl
CODE_9FC683:
	jsl.l GetPeriodTime
	lda.w $1D81
	beq CODE_9FC693
	lda.w #$0019
	sta.b $A5
	bra CODE_9FC6A6
CODE_9FC693:
	lda.w gsp
	cmp.w #$0003
	bmi CODE_9FC6A6
	lda.l $7E34BC
	bne CODE_9FC6A6
	lda.w #$012C
	sta.b $A5
CODE_9FC6A6:
	lda.b $A5
	sta.w gameclock
	sta.w $1C82
	sta.w $15D6
	rtl
ClearTeamStats:
	lda.w tmgoalie
	pha
	lda.w $17AC
	pha
	ldx.w #$0000
CODE_9FC6BD:
	stz.w $1742,x
	inx
	inx
	cpx.w #$01AC
	bne CODE_9FC6BD
	pla
	sta.w $17AC
	pla
	sta.w tmgoalie
	lda.w #$FFFF
	sta.w tmboxlist
	sta.w $18D4
setteams:
	stz.w tmsort
	lda.w #$000C
	sta.w $1768
	lda.w HomeTeam
	sta.w $1CE0
	asl a
	asl a
	tax
	lda.l TeamList,x
	sta.w tmdata
	lda.w VisTeam
	sta.w $1CE2
	asl a
	asl a
	tax
	lda.l TeamList,x
	sta.w $1CDE
	rtl
restoreteams:
	stz.b $91
	jsl.l CODE_9FC70D
	lda.w #$0002
	sta.b $91
CODE_9FC70D:
	ldy.b $91
	lda.w #$0006
	sta.w tmap,y
	lda.w #$0032
	sta.b $A5
CODE_9FC71A:
	lda.b $91
	beq CODE_9FC721
	lda.w #$0034
CODE_9FC721:
	clc
	adc.b $A5
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	dec.b $A5
	dec.b $A5
	bpl CODE_9FC71A
	rtl
GetPlayerRecord:
	lda.w #$009C
	sta.b $8B
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	ldy.w #$0000
	clc
	adc.b [$89]
	sta.b $89
	bra CODE_9FC752
CODE_9FC748:
	lda.b $89
	clc
	adc.b [$89]
	adc.w #$0008
	sta.b $89
CODE_9FC752:
	dec.b $A5
	bpl CODE_9FC748
	rtl
CODE_9FC757:
	lda.w pfteam,x
	beq CODE_9FC764
	stz.b $8D
	lda.w #$0002
	sta.b $91
	rtl
CODE_9FC764:
	lda.w #$0002
	sta.b $8D
	stz.b $91
	rtl
CODE_9FC76C:
	stz.b $91
	lda.w #$0001
	sta.b $93
	ldx.w $0AC6
	bpl CODE_9FC792
	txa
	eor.w #$FFFF
	inc a
	sta.b $93
	ldx.w #$0000
CODE_9FC782:
	lda.w $1C84,x
	cmp.b $93
	beq CODE_9FC792
	inx
	inx
	cpx.w #$000A
	bcc CODE_9FC782
	bra CODE_9FC79E
CODE_9FC792:
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9FC79E
	inc.b $91
	inc.b $91
CODE_9FC79E:
	rtl
CODE_9FC79F:
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b $B1
	stz.b $B3
	lda.w HomeTeam
	sta.b $A5
	jsr.w $C7EC
	lda.w VisTeam
	sta.b $A5
	jsr.w $C7EC
	ldx.w #$0000
CODE_9FC7BD:
	jsr.w $C7D7
	lda.b $A5
	sta.l $7E3528,x
	jsr.w $C7D7
	lda.b $A5
	sta.l $7E3538,x
	inx
	inx
	cpx.w #$0010
	bne CODE_9FC7BD
	rtl
CODE_9FC7D7:
	lda.w #$001A
	sta.b $A5
	jsl.l randomd0
	jsr.w $C7EC
	lda.w $1EAF
	cmp.w #$0000
	bne CODE_9FC7D7
	rts
CODE_9FC7EC:
	stz.w $1EAF
	lda.b $A5
	sec
	sbc.w #$0010
	bmi CODE_9FC80A
	jsr.w $C822
	lda.b $B3
	bit.w $1EB3
	beq CODE_9FC804
	inc.w $1EAF
CODE_9FC804:
	ora.w $1EB3
	sta.b $B3
	rts
CODE_9FC80A:
	lda.b $A5
	and.w #$000F
	jsr.w $C822
	lda.b $B1
	bit.w $1EB3
	beq CODE_9FC81C
	inc.w $1EAF
CODE_9FC81C:
	ora.w $1EB3
	sta.b $B1
	rts
CODE_9FC822:
	tay
	lda.w #$0001
CODE_9FC826:
	cpy.w #$0000
	beq CODE_9FC82F
	asl a
	dey
	bra CODE_9FC826
CODE_9FC82F:
	sta.w $1EB3
	rts
CODE_9FC833:
	lda.l $7E35D4
	cmp.w #$0002
	bcs CODE_9FC87B
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9FC845:
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9FC873
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FC873
	lda.w #$0000
	sta.l $7E3568,x
	lda.w #$0003
	jsl.l CODE_9BB385
	inc a
	sta.b $A5
	bra CODE_9FC86F
CODE_9FC86B:
	jsl.l CODE_9F9EB7
CODE_9FC86F:
	dec.b $A5
	bpl CODE_9FC86B
CODE_9FC873:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9FC845
CODE_9FC87B:
	rtl
InitScoutDisplay:
	lda.w #$FFFF
	sta.w $0D49
	sta.w $0D3F
	stz.w $0D43
	stz.w $0D45
	lda.w #$007E
	sta.b $8B
	lda.w #$347C
	sta.b $89
	rtl
CODE_9FC896:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8DA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$001D
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
	lda.w #DATA8_9CF8DF
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0000
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0020
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.w #$0400
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0010
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0020
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.w #$0800
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	jmp.w $A130
GetPlayerCount:
	lda.b $89
	pha
	lda.b $8B
	pha
	ldy.b $91
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	ldy.w #$0000
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	stz.b $A5
CODE_9FC95B:
	inc.b $A5
	lda.b [$89]
	clc
	adc.b $89
	adc.w #$0008
	sta.b $89
	lda.b [$89]
	cmp.w #$0002
	bne CODE_9FC95B
	pla
	sta.b $8B
	pla
	sta.b $89
	rtl
addteamstat:
	ldy.b $A9
	lda.w pfteam,x
	beq CODE_9FC97E
	iny
	iny
CODE_9FC97E:
	lda.w $0000,y
	clc
	adc.b $A5
	sta.w $0000,y
	rtl
CODE_9FC988:
	jsl.l CODE_9CA58C
	lda.w $1E9B
	bne CODE_9FC9B2
	ldy.w #$0008
CODE_9FC994:
	lda.w $19F6,y
	and.w #$FF00
	cmp.w #$8000
	bne CODE_9FC9AE
	lda.w $19F6,y
	and.w #$00FF
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FC9AE:
	dey
	dey
	bpl CODE_9FC994
CODE_9FC9B2:
	lda.w $19D0
	cmp.w #$0004
	bcc CODE_9FCA12
	ldx.w #$000A
	ldy.w #$0000
CODE_9FC9C0:
	lda.w position,x
	beq CODE_9FC9C8
	bmi CODE_9FC9C8
	iny
CODE_9FC9C8:
	dex
	dex
	bpl CODE_9FC9C0
	sty.b $A5
	ldx.w #$0008
	ldy.w #$0000
CODE_9FC9D4:
	lda.w $19F6,x
	cmp.w #$0000
	bne CODE_9FC9DD
	iny
CODE_9FC9DD:
	dex
	dex
	bpl CODE_9FC9D4
	cpy.b $A5
	bcs CODE_9FCA12
	cpy.w $19D0
	beq CODE_9FCA12
	ldy.w $0AF9
CODE_9FC9ED:
	iny
	iny
	cpy.w #$000A
	bne CODE_9FC9F7
	ldy.w #$0000
CODE_9FC9F7:
	lda.w $19F6,y
	bpl CODE_9FC9ED
	and.w #$00FF
	cmp.w #$0080
	beq CODE_9FC9ED
	cmp.w #$0000
	bne CODE_9FC9ED
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FCA12:
	lda.w $19D2
	cmp.w #$0004
	bcc CODE_9FCA75
	ldx.w #$0016
	ldy.w #$0000
CODE_9FCA20:
	lda.w position,x
	beq CODE_9FCA28
	bmi CODE_9FCA28
	iny
CODE_9FCA28:
	dex
	dex
	cpx.w #$000C
	bpl CODE_9FCA20
	sty.b $A5
	ldx.w #$0008
	ldy.w #$0000
CODE_9FCA37:
	lda.w $19F6,x
	cmp.w #$0002
	bne CODE_9FCA40
	iny
CODE_9FCA40:
	dex
	dex
	bpl CODE_9FCA37
	cpy.b $A5
	bcs CODE_9FCA75
	cpy.w $19D0
	beq CODE_9FCA75
	ldy.w $0AFB
CODE_9FCA50:
	iny
	iny
	cpy.w #$000A
	bne CODE_9FCA5A
	ldy.w #$0000
CODE_9FCA5A:
	lda.w $19F6,y
	bpl CODE_9FCA50
	and.w #$00FF
	cmp.w #$0080
	beq CODE_9FCA50
	cmp.w #$0002
	bne CODE_9FCA50
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
CODE_9FCA75:
	stz.w $0C23
	ldx.w #$0016
	lda.w #$FFFF
CODE_9FCA7E:
	sta.w $19D4,x
	stz.w $0B05,x
	stz.w $0BCB,x
	stz.w $0BEB,x
	stz.w $0C0B,x
	dex
	dex
	bpl CODE_9FCA7E
	sta.w $0BA3
	ldx.w #$0008
CODE_9FCA97:
	sta.w $19EC,x
	dex
	dex
	bpl CODE_9FCA97
	lda.w $19D0
	beq CODE_9FCAD8
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF5
	lda.w #$FFFF
	sta.w $0AF5
	dex
	dex
	bpl CODE_9FCAB8
	ldx.w #$0008
CODE_9FCAB8:
	lda.w $19F6,x
	bne CODE_9FCACD
	stx.b $B5
	phx
	lda.w $0AF5
	bpl CODE_9FCAC8
	stx.w $0AF5
CODE_9FCAC8:
	jsl.l CODE_9FCBB6
	plx
CODE_9FCACD:
	dex
	dex
	bpl CODE_9FCAD4
	ldx.w #$0008
CODE_9FCAD4:
	dec.b $0C
	bne CODE_9FCAB8
CODE_9FCAD8:
	lda.w $19D2
	beq CODE_9FCB15
	lda.w #$0005
	sta.b $0C
	ldx.w $0AF7
	lda.w #$FFFF
	sta.w $0AF7
	dex
	dex
	bpl CODE_9FCAF2
	ldx.w #$0008
CODE_9FCAF2:
	lda.w $19F6,x
	cmp.w #$0002
	bne CODE_9FCB0A
	stx.b $B5
	phx
	lda.w $0AF7
	bpl CODE_9FCB05
	stx.w $0AF7
CODE_9FCB05:
	jsl.l CODE_9FCBB6
	plx
CODE_9FCB0A:
	dex
	dex
	bpl CODE_9FCB11
	ldx.w #$0008
CODE_9FCB11:
	dec.b $0C
	bne CODE_9FCAF2
CODE_9FCB15:
	rtl
CODE_9FCB16:
	ldy.b $A5
	lda.w $19D4,y
	bpl CODE_9FCB5B
	phx
	ldx.w #$0000
	cpy.w #$000C
	bcc CODE_9FCB29
	ldx.w #$0002
CODE_9FCB29:
	lda.w $19D0,x
	beq CODE_9FCB4D
	ldy.w $0AFD,x
	dey
	dey
	bpl CODE_9FCB38
	ldy.w #$0008
CODE_9FCB38:
	lda.w #$0005
	sta.b $14
	txa
CODE_9FCB3E:
	cmp.w $19F6,y
	bne CODE_9FCB4F
	sty.b $B5
	tya
	sta.w $0AFD,x
	jsl.l CODE_9FCB68
CODE_9FCB4D:
	plx
	rtl
CODE_9FCB4F:
	dey
	dey
	bpl CODE_9FCB56
	ldy.w #$0008
CODE_9FCB56:
	dec.b $14
	bne CODE_9FCB3E
	plx
CODE_9FCB5B:
	rtl
CODE_9FCB5C:
	ldy.b $A5
	lda.w $19D4,y
	bpl CODE_9FCB67
	jsl.l CODE_9FCB68
CODE_9FCB67:
	rtl
CODE_9FCB68:
	lda.w #$FFFF
	sta.w $0BA3
	ldy.b $B5
	lda.w $19EC,y
	cmp.b $A5
	beq CODE_9FCBB5
	tay
	cpy.w #$0018
	bcs CODE_9FCB9A
	lda.w pflags,y
	and.w #$FFF7
	ora.w #$0002
	sta.w pflags,y
	lda.w #$FFFF
	sta.w $19D4,y
	lda.w position,y
	bne CODE_9FCB9A
	lda.w #$0000
	sta.w $0B05,y
CODE_9FCB9A:
	ldy.b $A5
	cpy.w #$0018
	bcs CODE_9FCBB5
	lda.w pflags,y
	ora.w #$0008
	sta.w pflags,y
	lda.b $B5
	sta.w $19D4,y
	tay
	lda.b $A5
	sta.w $19EC,y
CODE_9FCBB5:
	rtl
CODE_9FCBB6:
	stx.b $87
	ldx.w #$0000
CODE_9FCBBB:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FCBBB
	ldx.b $87
	lda.w #$0008
	sta.b $00
	ldy.w $0AD9
	bmi CODE_9FCC06
	lda.w position,x
	beq CODE_9FCBEB
	lda.w $19D4,x
	bmi CODE_9FCBEB
	lda.w $14E3,x
	bne CODE_9FCBEB
	lda.w $0B3D,x
	cmp.w #$0064
	bcs CODE_9FCBEB
	jmp.w $CCAE
CODE_9FCBEB:
	lda.w $19D4,y
	bmi CODE_9FCBF9
	tay
	lda.w $19F6,y
	cmp.w $19F6,x
	beq CODE_9FCC06
CODE_9FCBF9:
	ldy.w #$0000
	lda.w pfgoal,x
	bne CODE_9FCC04
	ldy.w #$0004
CODE_9FCC04:
	sty.b $00
CODE_9FCC06:
	lda.w #$0006
	sta.b $A9
	ldy.b $B5
	lda.w #$FFFF
	sta.b $AD
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq CODE_9FCC20
	ldx.w #$000C
CODE_9FCC20:
	lda.w position,x
	bmi CODE_9FCC96
	beq CODE_9FCC96
	lda.w pflags,x
	bit.w #$1000
	bne CODE_9FCC96
	lda.w SPA,x
	cmp.w #SPAturnl
	bcc CODE_9FCC3C
	cmp.w #SPAturnr+1
	bcc CODE_9FCC51
CODE_9FCC3C:
	cmp.w #DATA8_9DF196
	bcc CODE_9FCC46
	cmp.w #SPAburst+1
	bcc CODE_9FCC51
CODE_9FCC46:
	lda.w pflags,x
	and.w #$1000
	ora.w $14E3,x
	bne CODE_9FCC96
CODE_9FCC51:
	lda.w $19D4,x
	bmi CODE_9FCC5A
	cmp.b $B5
	bne CODE_9FCC96
CODE_9FCC5A:
	stz.b $14
	lda.w $0AD9
	bmi CODE_9FCC86
	lda.b $00
	cmp.w #$0008
	beq CODE_9FCC86
	eor.w $0B5D,x
	cmp.w #$0004
	bcc CODE_9FCC76
	eor.w #$FFFF
	adc.w #$0008
CODE_9FCC76:
	cmp.w #$0000
	beq CODE_9FCC86
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b $14
	sta.b $14
CODE_9FCC86:
	lda.w $0B1D,x
	clc
	adc.b $14
	bcs CODE_9FCC96
	cmp.b $AD
	bcs CODE_9FCC96
	stx.b $B1
	sta.b $AD
CODE_9FCC96:
	inx
	inx
	dec.b $A9
	bne CODE_9FCC20
	ldx.b $95
	lda.b $AD
	cmp.w #$FFFF
	beq CODE_9FCCFB
	ldy.b $B5
	lda.b $B1
	cmp.w $19EC,y
	bne CODE_9FCCF5
CODE_9FCCAE:
	lda.w $14E3,x
	bne CODE_9FCCFB
	lda.b $B5
	pha
	lda.b $B7
	pha
	lda.b $B9
	pha
	lda.b $BB
	pha
	lda.b $BD
	pha
	lda.b $BF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	jsl.l CODE_9EA242
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $BF
	pla
	sta.b $BD
	pla
	sta.b $BB
	pla
	sta.b $B9
	pla
	sta.b $B7
	pla
	sta.b $B5
	bra CODE_9FCCFB
CODE_9FCCF5:
	sta.b $A5
	jsl.l CODE_9FCB68
CODE_9FCCFB:
	stx.b $87
	ldx.w #$000E
CODE_9FCD00:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FCD00
	ldx.b $87
	rtl
CODE_9FCD0A:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD15
	ldy.w #$000C
CODE_9FCD15:
	lda.w $19D4,y
	bpl CODE_9FCD1F
	lda.w position,y
	bpl CODE_9FCD23
CODE_9FCD1F:
	iny
	iny
	bra CODE_9FCD15
CODE_9FCD23:
	phx
	jsl.l CODE_9FCD69
	plx
	rtl
CODE_9FCD2A:
	lda.w #$0000
	bra CODE_9FCD69
CODE_9FCD2F:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD3A
	ldy.w #$0002
CODE_9FCD3A:
	lda.w $1C94,y
	bne CODE_9FCD40
	rtl
CODE_9FCD40:
	lda.w #$0002
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0001
	bra CODE_9FCD69
CODE_9FCD4D:
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9FCD58
	ldy.w #$0002
CODE_9FCD58:
	lda.w $1C94,y
	bne CODE_9FCD5E
	rtl
CODE_9FCD5E:
	lda.w #$0001
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0002
CODE_9FCD69:
	sta.b $A9
	phx
	ldy.b $B5
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq CODE_9FCD7C
	ldx.w #$000C
CODE_9FCD7C:
	lda.w #$0005
	sta.b $A5
CODE_9FCD81:
	lda.w position,x
	cmp.b $A9
	beq CODE_9FCD90
	inx
	inx
	dec.b $A5
	bpl CODE_9FCD81
	bra CODE_9FCDAA
CODE_9FCD90:
	lda.w $19D4,x
	bpl CODE_9FCDAA
	lda.w pflags,x
	bit.w #$1000
	bne CODE_9FCDAA
	lda.w $0ADD,y
	inc a
	sta.w $0ADD,y
	stx.b $A5
	jsl.l CODE_9FCB68
CODE_9FCDAA:
	plx
	rtl
ResetBench:
	stz.w PBnum
	lda.w #$0010
	sta.b $A9
	stz.b $89
	jsl.l CODE_9FCDC4
	lda.w #$0001
	sta.b $A9
	lda.w #$0002
	sta.b $89
CODE_9FCDC4:
	lda.w #$0032
	sta.b $A5
CODE_9FCDC9:
	lda.w PBnum
	clc
	adc.b $A9
	sta.w PBnum
	lda.b $89
	beq CODE_9FCDD9
	lda.w #$0034
CODE_9FCDD9:
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9FCDFA
	beq CODE_9FCDFA
	bit.w #$1000
	beq CODE_9FCE16
	and.w #$07FF
	sta.b $AD
	bne CODE_9FCE16
	lda.w PBnum
	sec
	sbc.b $A9
	sta.w PBnum
	bra CODE_9FCE16
CODE_9FCDFA:
	lda.w PBnum
	sec
	sbc.b $A9
	sta.w PBnum
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FCE16
	cmp.w #$FFFC
	beq CODE_9FCE16
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9FCE16:
	dec.b $A5
	dec.b $A5
	bpl CODE_9FCDC9
	rtl
forcepldata:
	stx.b $87
	ldx.w #$0000
CODE_9FCE22:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FCE22
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FCE33:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FCE33
	ldx.b $87
	ldy.b $91
	lda.w tmsort,y
	sta.b $95
	lda.w #$0005
	sta.b $B5
CODE_9FCE4B:
	ldx.b $95
	lda.w newpos,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FCE5B
	ora.w #$FF00
CODE_9FCE5B:
	sta.b $A5
	sta.w position,x
	cmp.w #$0000
	bmi CODE_9FCE9E
	jsl.l Setplass
	ldx.b $95
	lda.w position,x
	cmp.w #$0004
	bne CODE_9FCE7C
	lda.w #$0012
	sta.b $A5
	jsl.l assinsert
CODE_9FCE7C:
	ldx.b $95
	lda.w newpnum,x
	and.w #$00FF
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FCE8E
	lda.w #$0034
CODE_9FCE8E:
	clc
	adc.b $B1
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b $B1
	jsl.l setplayer
CODE_9FCE9E:
	ldx.b $95
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	inc.b $95
	inc.b $95
	dec.b $B5
	bpl CODE_9FCE4B
	stx.b $87
	ldx.w #$000E
CODE_9FCEB6:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FCEB6
	ldx.b $87
	stx.b $87
	ldx.w #$0012
CODE_9FCEC4:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FCEC4
	ldx.b $87
	ldx.b $95
	rtl
Setplass:
	lda.w position,x
	sta.b $A5
	bmi CODE_9FCEEE
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FCEEF
	sta.b $89
	ldy.b $A5
	lda.b [$89],y
	and.w #$00FF
	sta.b $A5
	jml.l CODE_9E8C18
CODE_9FCEEE:
	rtl
DATA8_9FCEEF:
	db $07,$02,$02,$03,$05,$03,$05
setplayer:
	phx
	phy
	lda.w pflags,x
	and.w #$FFFB
	sta.w pflags,x
	stz.b $89
	lda.w pfteam,x
	beq CODE_9FCF0C
	inc.b $89
	inc.b $89
CODE_9FCF0C:
	lda.b $B1
	and.w #$00FF
	sta.w pnum,x
	asl a
	sta.b $B1
	lda.w #$000B
	sta.b $A5
	lda.b $89
	beq CODE_9FCF23
	lda.w #$0034
CODE_9FCF23:
	adc.b $B1
	tay
	lda.w tmpdst,y
	sta.b $A9
	tya
	sta.b $14
	asl a
	adc.b $14
	asl a
	sta.b $14
	lda.b $A9
	bpl CODE_9FCF44
	lda.w #$000A
	sta.b $A5
	lda.b $A9
	cmp.w #$FFFE
	bne CODE_9FCF4E
CODE_9FCF44:
	jsl.l assinsert
	stz.w $14E3,x
	stz.w SPA,x
CODE_9FCF4E:
	lda.b $89
	beq CODE_9FCF55
	lda.w #$0034
CODE_9FCF55:
	clc
	adc.b $B1
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b $B1
	ldy.b $89
	lda.w tmdata,y
	sta.b $89
	lda.w #$009C
	sta.b $8B
	lda.b $89
	pha
	lda.b $8B
	pha
	ldy.w #$0008
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	stz.w PPBonus
	stz.w PKBonus
	stz.w $0CE5
	stz.w HmAwBonus
	lda.w position,x
	bne CODE_9FCF91
	jmp.w $D01F
CODE_9FCF91:
	lda.w sflags
	bit.w #$2000
	beq CODE_9FCFBF
	jsl.l chkpk2
	beq CODE_9FCFAC
	ldy.w #$0001
	lda.b [$89],y
	and.w #$000F
	sta.w PPBonus
	bra CODE_9FCFBF
CODE_9FCFAC:
	ldy.w #$0001
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.w PKBonus
CODE_9FCFBF:
	ldy.w #$0002
	lda.b [$89],y
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9FCFDD
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	sta.b $A5
CODE_9FCFDD:
	lda.b $A5
	sta.w HmAwBonus
	lda.w gsp
	sec
	sbc.w #$0002
	bmi CODE_9FD01F
	bne CODE_9FCFFD
	jsl.l GetPeriodTime
	lsr.b $A5
	lda.b $A5
	sec
	sbc.w gameclock
	beq CODE_9FCFFD
	bpl CODE_9FD01F
CODE_9FCFFD:
	lda.w $178E
